import 'package:cash_app/core/utils/assets.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:cash_app/features/check_user/presentation/views/check_user_view_data.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constant.dart';


class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 5),
        Image.asset(
          '${AssetsData.logo}',
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.14,
          ),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 7.0,
            animationDuration: 2500,
            percent: 1,
            barRadius: const Radius.circular(50),
            progressColor: AppConstants.primaryColor,
            onAnimationEnd: () {
              if (MyConfigCach.getString(key: MyConfigCacheKeys.token) == '') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckUserView(),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeLayoutScreen(),
                  ),
                );
              }
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => CheckUserView()));
            },
          ),
        ),
      ],
    );
  }
}
