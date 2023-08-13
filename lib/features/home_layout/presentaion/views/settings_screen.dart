
import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_card_in_setting.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'account_screen.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 80, bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppConstants.primaryColor,
                    radius: 60.8,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage: AssetImage("assets/images/logo_cash.png",
                      ),backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomContainerProfile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccountScreen()));
                    },
                    icon: const Icon(
                        Icons.person_outline,
                        color: Colors.black
                    ),
                    text: "الملف الشخصي",
                    // textColor: AppColors.blackColorPlayed,
                    iconColor:Colors.black
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomContainerProfile(
                    onTap: () {
                      Navigator.pushNamed(context, 'about-us');
                    },
                    icon: const Icon(
                        Iconsax.notification,
                        // color: Color(0xff307a59),
                        // color: AppColors.blackColor,
                        color:  Colors.black
                    ),
                    text: "الاشعارات",
                    iconColor: Colors.black
                  // textColor: AppColors.blackColorPlayed,
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomContainerProfile(
                    onTap: () {
                      Navigator.pushNamed(context, 'about-us');
                    },
                    icon: const Icon(
                        Iconsax.personalcard,

                        color:  Colors.black
                    ),
                    text: "معلومات عنا",
                    iconColor: Colors.black
                  // textColor: AppColors.blackColorPlayed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

