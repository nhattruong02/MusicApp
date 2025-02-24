import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/constants/colors.dart';
import 'package:musicapp/ui/home/viewmodel.dart';
import 'package:musicapp/ui/play_song_screen/audio_player_manager.dart';
import 'package:musicapp/ui/play_song_screen/play_song_screen.dart';
import 'package:musicapp/utils/inner_shadow.dart';
import 'package:musicapp/widgets/inner_button.dart';

import '../../constants/strings.dart';
import '../../data/model/song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> songs = [];
  late MusicAppViewModel _viewModel;
  @override
  void initState() {
    _viewModel = MusicAppViewModel();
    _viewModel.loadSongs();
    observeData();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.songStream.close();
    AudioPlayerManager().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.bgGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameArtistAndNameSong(),
          _buildImageSong(),
          _buildTextPlaylist(),
          46.verticalSpace,
          _buildListSong(),
        ],
      ),
    );
  }

  Widget _buildNameArtistAndNameSong() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 54).w,
            child: Text(
              "Cardi B",
              style: TextStyle(
                fontFamily: AppStrings.fontFamilyAmazon,
                fontSize: 30.sp,
                color: AppColors.colorIconAndText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16).w,
            child: Text(
              "Invasion Of Privacy",
              style: TextStyle(
                fontFamily: AppStrings.fontFamilyAmazon,
                fontSize: 23.sp,
                color: AppColors.colorSubText,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageSong() {
    return Center(
      child: InnerShadow(
        shadows: [
          BoxShadow(
              color: Colors.white.withOpacity(0.87),
              blurRadius: 5,
              offset: const Offset(-5, -5)),
          BoxShadow(
              color: Colors.black.withOpacity(0.17),
              blurRadius: 12,
              offset: const Offset(6, 6)),
        ],
        child: Container(
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorBGImageSongAndBGButton,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4)
              ]),
        ),
      ),
    );
  }

  Widget _buildTextPlaylist() {
    return Container(
        margin: const EdgeInsets.only(top: 41, left: 29).w,
        child: Text(AppStrings.textMyPlaylist,
            style: TextStyle(
              fontFamily: AppStrings.fontFamilyAmazon,
              fontSize: 27.sp,
              color: AppColors.colorIconAndText,
              fontWeight: FontWeight.bold,
            )));
  }

  Widget _buildListSong() {
    return Expanded(
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          var song = songs[index];
          return Column(
            children: [_buildLineSong(song), 20.verticalSpace],
          );
        },
      ),
    );
  }

  Widget _buildLineSong(Song song) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _navigatePlaySongScreen(song),
          child: Container(
            margin: const EdgeInsets.only(left: 29).w,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorBGImageSongAndBGButton,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                  const BoxShadow(
                      color: Colors.white,
                      blurRadius: 4,
                      offset: Offset(-2, -2))
                ]),
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: const Icon(
                Icons.play_arrow_rounded,
                color: AppColors.colorIconAndText,
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25).w,
            child: Text(
              song.title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppStrings.fontFamilyAmazon,
                fontSize: 23.sp,
                color: AppColors.colorTextNameSong.withOpacity(0.71),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 44).w,
          child: InnerButton(
            withButton: 45,
            heightButton: 45,
            iconButton: Icons.favorite,
            colorIcon: AppColors.colorIconAndText,
            withIcon: 20,
            heightIcon: 17,
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
        )
      ],
    );
  }

  void observeData() {
    _viewModel.songStream.stream.listen(
      (listSong) {
        setState(() {
          songs.addAll(listSong);
        });
      },
    );
  }

  void _navigatePlaySongScreen(Song song) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PlaySongScreen(listSong: songs, currentSong: song),
        ));
  }
}
