import 'package:cash_app/constant.dart';
import 'package:cash_app/features/auth/managers/auth_cubit.dart';
import 'package:cash_app/features/auth/presentation/views/login_view.dart';
import 'package:cash_app/features/check_user/presentation/views/check_user_view_data.dart';
import 'package:cash_app/features/check_user/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../check_user/presentation/views/widgets/custom_text_form_field.dart';

class CreateBody extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPass = false;
  bool isConfirmPass = false;

  CreateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          SnackBar snackBar = SnackBar(
            backgroundColor: Colors.white,
            elevation: 10.sp,
            content: Text(
              'تم انشاء حساب جديد بنجاح',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        }
        if (state is SignupErrorState) {
          SnackBar snackBar = SnackBar(
            backgroundColor: Colors.white,
            elevation: 10.sp,
            content: Text(
              'حدثت مشكلة اثناء انشاء حساب جديد',
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
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppConstants.primaryColor,
                            radius: 20.r,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(AssetsData.logo, height: 250.h),
                    Text(
                      "انشاء حساب جديد",
                      style: GoogleFonts.poppins(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      "الأسم",
                      Icon(
                        Icons.person,
                        color: Colors.grey.withOpacity(0.8),
                        size: 22.sp,
                      ),
                      nameController,
                      false,
                      TextInputType.text,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                        "الهاتف",
                        Icon(
                          Icons.phone,
                          color: Colors.grey.withOpacity(0.8),
                          size: 22.sp,
                        ),
                        phoneController,
                        false,
                        TextInputType.phone),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                        "كلمة المرور",
                        Icon(Icons.visibility_outlined,
                            color: Colors.transparent),
                        passwordController,
                        true,
                        TextInputType.visiblePassword),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                        "تأكيد كلمة المرور",
                        Icon(
                          Icons.visibility_outlined,
                          color: Colors.transparent,
                        ),
                        confirmPasswordController,
                        true,
                        TextInputType.visiblePassword),
                    SizedBox(height: 30.h),
                    state is SignupLoadingState ? Center(child: CircularProgressIndicator(color: AppConstants.primaryColor,),) : GestureDetector(
                      onTap: () {
                        cubit.signup(
                          phoneController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                          nameController.text,
                        );
                      },
                      child: state is SignupLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppConstants.primaryColor,
                              ),
                            )
                          : CustomButtonWidget(
                              Colors.white,
                              "انساء حساب جديد",
                              AppConstants.primaryColor,
                              AppConstants.primaryColor),
                    ),
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
