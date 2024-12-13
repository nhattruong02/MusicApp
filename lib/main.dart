import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/data/repository/repository.dart';
import 'package:musicapp/ui/bottom_bar/app_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var repository = DefaultRepository();
  var songs = await repository.loadData();
  if (songs != null) {
    for (var song in songs) {
      debugPrint(song.toString());
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppMainScreen(),
        );
      },
    );
  }
}
