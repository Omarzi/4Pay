import 'package:cash_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  Color color;
  Color bgColor;
  Color borderColor;
  String text;

  CustomButtonWidget(this.color, this.text, this.bgColor, this.borderColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 400.w,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ),
    );
  }
}
