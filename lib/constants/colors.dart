import 'package:flutter/material.dart';

class AppColors {
  static const bgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFD8CAFF), Color(0xFFD4DEFD)],
  );
  static LinearGradient bgBottomBar = LinearGradient(
    stops: const [0, 1],
    colors: [
      const Color(0xFFFFFFFF).withOpacity(0.35),
      const Color(0xFFD6D6FE)
    ],
  );
  static const colorIntro = Color(0xFFE1E1FA);
  static const colorTextTitle = Color(0xFF2C4271);
  static const colorTextDes = Color(0xFF5B6C97);
  static const colorIconAndText = Color(0xFF2C4271);
  static const colorSubText = Color(0xFF6A88AC);
  static const colorBGImageSongAndBGButton = Color(0xFFD5DFFE);
  static const colorTextNameSong = Color(0xFF2C4271);
  static const colorSliderAndBGPlayButton = Color(0xFF6C7BE8);
  static const colorShadowNextAndPreviousButton = Color(0xFF7A91FF);
  static const colorShadowPauseButton = Color(0xFF001FFF);
}
