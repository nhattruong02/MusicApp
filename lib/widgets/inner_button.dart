import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../utils/inner_shadow.dart';

class InnerButton extends StatelessWidget {
  final double withButton;
  final double heightButton;
  final Color? colorBGButton;
  final IconData? iconButton;
  final Color? colorIcon;
  final double? withIcon;
  final double? heightIcon;
  List<Shadow>? shadows;
  final void Function()? function;

  InnerButton(
      {required this.withButton,
      required this.heightButton,
      this.iconButton,
      this.colorIcon,
      this.withIcon,
      this.heightIcon,
      this.shadows,
      this.colorBGButton,
      this.function});
  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: shadows!,
      child: GestureDetector(
        onTap: function,
        child: Container(
          width: withButton.w,
          height: heightButton.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorBGButton ?? AppColors.colorBGImageSongAndBGButton),
          child: SizedBox(
            width: withIcon!.w,
            height: heightIcon!.h,
            child: Icon(
              iconButton,
              color: colorIcon,
            ),
          ),
        ),
      ),
    );
  }
}
