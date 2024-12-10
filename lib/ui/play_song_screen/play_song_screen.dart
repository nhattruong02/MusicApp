import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/constants/colors.dart';
import 'package:musicapp/constants/strings.dart';
import 'package:musicapp/widgets/inner_button.dart';

class PlaySongScreen extends StatefulWidget {
  const PlaySongScreen({super.key});

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.bgGradient),
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
          "Cardi B",
          style: TextStyle(
            fontFamily: AppStrings.fontFamilyAmazon,
            fontSize: 18.sp,
            color: AppColors.colorIconAndText,
            fontWeight: FontWeight.bold,
          ),
        ),
        11.verticalSpace,
        Text(
          "Invasion Of Privacy",
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
      height: 17,
      margin: EdgeInsets.symmetric(horizontal: 41.h),
      child: Slider(
        value: 10,
        min: 0,
        max: 15,
        label: 0.2.round().toString(),
        activeColor: AppColors.colorSliderAndBGPlayButton,
        inactiveColor: Colors.white,
        onChanged: (value) {},
      ),
    );
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
          ),
          InnerButton(
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
          ),
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
          ),
        ],
      ),
    );
  }
}
