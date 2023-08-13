import 'package:cash_app/constant.dart';
import 'package:cash_app/features/auth/managers/auth_cubit.dart';
import 'package:cash_app/features/auth/presentation/views/create_view.dart';
import 'package:cash_app/features/check_user/presentation/views/widgets/custom_button.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../check_user/presentation/views/widgets/custom_text_form_field.dart';

class LoginBody extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 250),
              pageBuilder: (_, __, ___) => const HomeLayoutScreen(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        } else if (state is AuthErrorState) {
          SnackBar snackBar = SnackBar(
            backgroundColor: Colors.white,
            elevation: 10.sp,
            content: Text(
              'حدثت مشكلة اثناء تسجيل الدخول',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit  = BlocProvider.of<AuthCubit>(context);

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AssetsData.logo, height: 250.h),
                    Text(
                      "مرحبًا بعودتك",
                      // style: Styles.textStyle30,
                      style: GoogleFonts.poppins(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "تسجيل الدخول في حسابك",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextFormField(
                      "الهاتف",
                      Icon(
                        Icons.phone,
                        color: Colors.grey.withOpacity(0.8),
                        size: 22.sp,
                      ),
                      phoneController,
                      false,
                      TextInputType.phone,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                        "كلمة المرور",
                        const Icon(
                          Icons.visibility_outlined,
                          color: Colors.transparent,
                        ),
                        passwordController,
                        true,
                        TextInputType.visiblePassword),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: () {
                        cubit.login(
                          phoneController.text,
                          passwordController.text,
                        );
                      },
                      child: CustomButtonWidget(Colors.white, "تسجيل الدخول",
                          AppConstants.primaryColor, AppConstants.primaryColor),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text(
                            "انشاء حساب جديد",
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 250),
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
                        ),
                        const Text("  ليس لديك حساب؟"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
