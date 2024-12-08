import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadImageAsset extends StatelessWidget {
  final String? imageName;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  LoadImageAsset({
    required this.imageName,
    this.width,
    this.height,
    this.boxFit,
  });
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$imageName.png",
      width: width!.w,
      height: height!.h,
      fit: boxFit,
    );
  }
}
