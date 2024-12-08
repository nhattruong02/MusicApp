import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/constants/strings.dart';
import 'package:musicapp/widgets/load_image_asset.dart';

import '../../constants/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(gradient: AppColors.bgGradient),
      child: Column(
        children: [_buildImageOnboarding(), _buildIntro()],
      ),
    ));
  }

  Widget _buildImageOnboarding() {
    return Container(
      margin: const EdgeInsets.only(top: 83, left: 30, right: 29).w,
      child: LoadImageAsset(
        imageName: AppStrings.imgOnboarding,
        width: 369,
        height: 361,
        boxFit: BoxFit.fill,
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      margin: const EdgeInsets.only(top: 19, left: 75, right: 74).w,
      width: 279.w,
      height: 273.h,
      decoration: BoxDecoration(
        color: AppColors.colorIntro,
        borderRadius: BorderRadius.circular(41),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(10, 10),
          ),
          BoxShadow(
              color: Colors.white.withOpacity(0.6),
              blurRadius: 20,
              offset: const Offset(-15, -15))
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 19, horizontal: 22).w,
            child: Text(
              AppStrings.textTitleOnBoardingFirst,
              style: TextStyle(
                fontFamily: AppStrings.fontFamilyAmazon,
                fontSize: 35.sp,
                color: AppColors.colorTextTitle,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 51).w,
            child: Text(
              AppStrings.textDesOnBoardingFirst,
              style: TextStyle(
                fontFamily: AppStrings.fontFamilyAmazon,
                fontSize: 16.sp,
                color: AppColors.colorTextDes,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
