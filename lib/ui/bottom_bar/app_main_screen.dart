import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/constants/colors.dart';

import '../home/home_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
/*    const AddUserScreen(),
    const SettingScreen()*/
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 98.h,
          decoration: BoxDecoration(
              gradient: AppColors.bgBottomBar,
              border: const Border(
                top: BorderSide(color: Colors.white, width: 1),
                left: BorderSide(color: Colors.white, width: 1),
              )),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              backgroundColor: Colors.black,
              onTap: (value) {
                setState(() {});
                selectedIndex = value;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    size: 27,
                    Icons.home,
                    color: AppColors.colorIconAndText,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shuffle,
                    color: AppColors.colorIconAndText,
                    size: 27,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: AppColors.colorIconAndText,
                    size: 27,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: AppColors.colorIconAndText,
                    size: 27,
                  ),
                  label: "",
                ),
              ]),
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}
