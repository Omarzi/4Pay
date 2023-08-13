import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/services_screen.dart';
import 'package:cash_app/features/home_layout/presentaion/views/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatefulWidget {

  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  List<Widget> tabs = const [
    ServicesScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: AppConstants.primaryColor,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services_outlined), label: 'الخدمات'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الأعدادات'),
          ],
        ),
      ),
    );
  }
}
