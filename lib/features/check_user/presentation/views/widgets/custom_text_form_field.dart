
import 'package:cash_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextFormField extends StatelessWidget {
  String text;
  Widget icon;
  TextEditingController textEditingController;
  bool isObscure;
  TextInputType type;
  CustomTextFormField(this.text,this.icon, this.textEditingController, this.isObscure, this.type, {super.key});
  @override
  Widget build(BuildContext context) {
    return
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: textEditingController,
          obscureText: isObscure,
          keyboardType: type,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            filled: true,
            fillColor: Colors.grey[200],suffixIcon: icon,
            suffixIconColor: AppConstants.primaryColor,
            hintText: text,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey.withOpacity(0.9),
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                width: 2,
                color: AppConstants.primaryColor,
              ),
              borderRadius:
              BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                  width: 1,
                  color: Colors.red
              ),
              borderRadius:
              BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                width: 2,
                color: AppConstants.primaryColor,
              ),
              borderRadius:
              BorderRadius.circular(15),
            ),
          ),
        ),
      );
  }
}
