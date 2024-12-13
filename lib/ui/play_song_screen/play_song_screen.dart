import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/constants/colors.dart';
import 'package:musicapp/constants/strings.dart';
import 'package:musicapp/widgets/inner_button.dart';

import '../../data/model/song.dart';
import 'audio_player_manager.dart';

class PlaySongScreen extends StatefulWidget {
  final List<Song> listSong;
  final Song currentSong;
  const PlaySongScreen(
      {super.key, required this.listSong, required this.currentSong});

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  late AudioPlayerManager _audioPlayerManager;
  late int _selectedItemIndex;
  late Song _song;

  @override
  void initState() {
    _song = widget.currentSong;
    _audioPlayerManager = AudioPlayerManager();
    _selectedItemIndex = widget.listSong.indexOf(widget.currentSong);
    if (_audioPlayerManager.songUrl?.compareTo(_song.source!) != 0) {
      _audioPlayerManager.updateSongUrl(_song.source!);
      _audioPlayerManager.prepare(isNewSong: true);
    } else {
      _audioPlayerManager.prepare(isNewSong: false);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: AppColors.bgGradient),
          child: Column(
            children: [
              83.verticalSpace,
              _buildTopLayer(),
              _buildMusicIcon(),
              _buildMusicName(),
              49.verticalSpace,
              _buildMusicLength(),
              60.verticalSpace,
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopLayer() {
    return Container(
      margin: const EdgeInsets.only(left: 49, right: 50).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InnerButton(
            withButton: 50,
            heightButton: 50,
            iconButton: Icons.arrow_back_ios_new_outlined,
            heightIcon: 20,
            withIcon: 20,
            colorIcon: AppColors.colorIconAndText,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.17),
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.49),
                  blurRadius: 2,
                  offset: const Offset(-2, -2))
            ],
            function: () => Navigator.pop(context),
          ),
          Text(
            AppStrings.textNowPlaying,
            style: TextStyle(
              fontFamily: AppStrings.fontFamilyAmazon,
              fontSize: 18.sp,
              color: AppColors.colorIconAndText,
              fontWeight: FontWeight.bold,
            ),
          ),
          InnerButton(
            withButton: 50,
            heightButton: 50,
            iconButton: Icons.more_horiz,
            heightIcon: 10,
            withIcon: 30,
            colorIcon: AppColors.colorIconAndText,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.17),
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.49),
                  blurRadius: 2,
                  offset: const Offset(-2, -2))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMusicIcon() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 39.h, vertical: 50.w),
        width: 350.w,
        height: 350.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorIntro,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(9, 9),
            ),
            const BoxShadow(
                color: Colors.white, blurRadius: 20, offset: Offset(-9, -9))
          ],
        ));
  }

  Widget _buildMusicName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _song.title!,
          style: TextStyle(
            fontFamily: AppStrings.fontFamilyAmazon,
            fontSize: 18.sp,
            color: AppColors.colorIconAndText,
            fontWeight: FontWeight.bold,
          ),
        ),
        11.verticalSpace,
        Text(
          _song.artist!,
          style: TextStyle(
            fontFamily: AppStrings.fontFamilyAmazon,
            fontSize: 18.sp,
            color: AppColors.colorSubText,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget _buildMusicLength() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 41.h), child: _progressBar());
  }

  Widget _buildBottomButtons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 75.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InnerButton(
            withButton: 70,
            heightButton: 70,
            iconButton: Icons.skip_previous,
            heightIcon: 27,
            withIcon: 46,
            colorIcon: AppColors.colorIconAndText,
            shadows: [
              BoxShadow(
                color: AppColors.colorShadowNextAndPreviousButton
                    .withOpacity(0.18),
                blurRadius: 6,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.52),
                  blurRadius: 6,
                  offset: const Offset(-3, -3))
            ],
            function: () => _setPrevSong(),
          ),
          _playButton(),
          InnerButton(
            withButton: 70,
            heightButton: 70,
            iconButton: Icons.skip_next,
            heightIcon: 27,
            withIcon: 46,
            colorIcon: AppColors.colorIconAndText,
            shadows: [
              BoxShadow(
                color: AppColors.colorShadowNextAndPreviousButton
                    .withOpacity(0.18),
                blurRadius: 6,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.52),
                  blurRadius: 6,
                  offset: const Offset(-3, -3))
            ],
            function: () => _setNextSong(),
          ),
        ],
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _audioPlayerManager.durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          baseBarColor: Colors.white,
          thumbColor: AppColors.colorSliderAndBGPlayButton,
          progressBarColor: AppColors.colorSliderAndBGPlayButton,
          timeLabelLocation: TimeLabelLocation.none,
          onSeek: _audioPlayerManager.player.seek,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder(
      stream: _audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playState = snapshot.data;
        final processingState = playState?.processingState;
        final playing = playState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return CircularProgressIndicator();
        } else if (playing != true) {
          return InnerButton(
            withButton: 70,
            heightButton: 70,
            iconButton: Icons.play_arrow_rounded,
            heightIcon: 27,
            withIcon: 46,
            colorIcon: Colors.white,
            colorBGButton: AppColors.colorSliderAndBGPlayButton,
            shadows: [
              BoxShadow(
                color: AppColors.colorShadowPauseButton.withOpacity(0.42),
                blurRadius: 6,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.27),
                  blurRadius: 6,
                  offset: const Offset(-3, -3))
            ],
            function: () {
              _audioPlayerManager.player.play();
            },
          );
        } else if (processingState != ProcessingState.completed) {
          return InnerButton(
            withButton: 70,
            heightButton: 70,
            iconButton: Icons.pause,
            heightIcon: 27,
            withIcon: 46,
            colorIcon: Colors.white,
            colorBGButton: AppColors.colorSliderAndBGPlayButton,
            shadows: [
              BoxShadow(
                color: AppColors.colorShadowPauseButton.withOpacity(0.42),
                blurRadius: 6,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(0.27),
                  blurRadius: 6,
                  offset: const Offset(-3, -3))
            ],
            function: () => _audioPlayerManager.player.pause(),
          );
        } else {
          return InnerButton(
              withButton: 70,
              heightButton: 70,
              iconButton: Icons.pause,
              heightIcon: 27,
              withIcon: 46,
              colorIcon: Colors.white,
              colorBGButton: AppColors.colorSliderAndBGPlayButton,
              shadows: [
                BoxShadow(
                  color: AppColors.colorShadowPauseButton.withOpacity(0.42),
                  blurRadius: 6,
                  offset: const Offset(3, 3),
                ),
                BoxShadow(
                    color: Colors.white.withOpacity(0.27),
                    blurRadius: 6,
                    offset: const Offset(-3, -3))
              ],
              function: () => _audioPlayerManager.player.seek(Duration.zero));
        }
      },
    );
  }

  void _setNextSong() {
    ++_selectedItemIndex;
    if (_selectedItemIndex > widget.listSong.length - 1) {
      _selectedItemIndex = 0;
    }
    final nextSong = widget.listSong[_selectedItemIndex];
    _audioPlayerManager.updateSongUrl(nextSong.source!);
    setState(() {
      _song = nextSong;
      _audioPlayerManager.prepare(isNewSong: true);
    });
  }

  void _setPrevSong() {
    --_selectedItemIndex;
    if (_selectedItemIndex < 0) {
      _selectedItemIndex = widget.listSong.length - 1;
    }
    final prevSong = widget.listSong[_selectedItemIndex];
    _audioPlayerManager.updateSongUrl(prevSong.source!);
    setState(() {
      _song = prevSong;
    });
    _audioPlayerManager.prepare(isNewSong: true);
  }
}
