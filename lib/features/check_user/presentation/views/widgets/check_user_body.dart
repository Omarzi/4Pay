import 'package:cash_app/constant.dart';
import 'package:cash_app/core/utils/assets.dart';
import 'package:cash_app/features/auth/presentation/views/create_view.dart';
import 'package:cash_app/features/auth/presentation/views/login_view.dart';
import 'package:cash_app/features/check_user/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckUserBody extends StatelessWidget {
  const CheckUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
      child: Column(
        children: [
          Image.asset(AssetsData.logo),
          SizedBox(height: 18.h),
          Text(
            "تطبيق مالي يمكنك الوثوق به",
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppConstants.primaryColor,
            ),
          ),
          SizedBox(height: 50.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (_, __, ___) => const LoginView(),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: CustomButtonWidget(
              const Color(0xffffffff),
              "تسجيل الدخول",
              AppConstants.primaryColor,
              AppConstants.primaryColor,
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (_, __, ___) => const CreateView(),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: CustomButtonWidget(
              AppConstants.primaryColor,
              "انشاء حساب جديد",
              const Color(0xffffffff),
              AppConstants.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
