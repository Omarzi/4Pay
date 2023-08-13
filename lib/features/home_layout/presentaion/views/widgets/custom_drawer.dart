import 'package:cash_app/constant.dart';
import 'package:cash_app/core/utils/assets.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:cash_app/features/auth/presentation/views/login_view.dart';
import 'package:cash_app/features/home_layout/presentaion/managers/air_charge/air_charge_cubit.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Drawer(
          backgroundColor: AppConstants.primaryColor,
          child: Column(
            children: [
              customTopInDrawer(context),
              customRowInBodyInDrawer(BlocProvider.of<AirChargeCubit>(context).charge.toString(), 'الرصيد ١ : '),
              customRowInBodyInDrawer('0.00', 'الرصيد ٢ : '),
              customRowInBodyInDrawer('0.00', 'اجل شركة : '),
              customRowInBodyInDrawer('0.00', 'اجل وكيل : '),
              customRowInBodyInDrawer('لخدمات الدفع الألكتروني', 'المحل : '),
              customRowInBodyInDrawer(MyConfigCach.getInt(key: MyConfigCacheKeys.code).toString(), 'الكود : '),
              customRowInBodyInDrawer('حساب تاجر', 'المجموعة : '),
              customRowInBodyInDrawer('1', 'المشرف : '),
              SizedBox(height: 10.h),
              // CustomDivider(),
              materialButton(context),
              const Spacer(),
              connectPay(),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTopInDrawer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AssetsData.arrowBack,
            color: Colors.amber,
            width: 42,
          ),
        ),
        Image.asset(
          AssetsData.person,
          width: 100,
        ),
        Image.asset(
          AssetsData.settings,
          color: Colors.amber,
          width: 42,
        ),
      ],
    );
  }

  Widget customRowInBodyInDrawer(String num, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            num.toString(),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget materialButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 5.0,
        minWidth: 200.0,
        height: 48,
        color: Colors.red,
        child: SizedBox(
          width: 130,
          child: Row(
            children: const [
              Text(
                'تسجيل الخروج',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.logout,
                size: 24,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () {
          MyConfigCach.removeFromShared(key: MyConfigCacheKeys.roles);
          MyConfigCach.removeFromShared(key: MyConfigCacheKeys.userId);
          MyConfigCach.removeFromShared(key: MyConfigCacheKeys.name);
          MyConfigCach.removeFromShared(key: MyConfigCacheKeys.token);
          print(MyConfigCach.getString(key: MyConfigCacheKeys.token));
          print(MyConfigCach.getString(key: MyConfigCacheKeys.roles));
          print(MyConfigCach.getString(key: MyConfigCacheKeys.userId));
          print('haaaaahahhahahahahahhah');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        },
      ),
    );
  }

  Widget connectPay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '2023 @ ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Text(
          'ay',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Text(
          'P',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),

        Text(
          '4',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
