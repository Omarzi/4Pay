import 'package:cash_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';

class MobileBillEtisalat extends StatefulWidget {
  String image;
  String text;

  MobileBillEtisalat(this.image, this.text);

  @override
  State<MobileBillEtisalat> createState() => _HomeInternetBillsState();
}

class _HomeInternetBillsState extends State<MobileBillEtisalat> {
  @override
  // Option 2
  String? selectItem;
  String gender="kk";
  String? newf;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(text: 'لخدمات الدفع الألكتروني'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: 50.w,
              height: 20.h,
            ),
            Directionality(
              textDirection:  TextDirection.rtl,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    borderRadius: BorderRadius.circular(10.sp)
                ),

                height: MediaQuery.of(context).size.height/12,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.account_box_rounded,color: Colors.white,size: 40.sp,),
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 1.w),
                          child: TextFormField(
                            validator: (text) {
                              if (text!.length < 8) {
                                return "برجاء ادخال رقم هاتف صحيح من 11 رقم";
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:  BorderSide(width: 0,color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.sp)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:  BorderSide(width: 0,color: Colors.white),
                                  borderRadius: BorderRadius.circular(5.sp)
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 0.3.w, color: Colors.red),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "رقم الموبيل",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 14,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: Color(0xff007e00)
              ),
              child: Center(
                child: Text("استعلام",
                  style: TextStyle(
                      fontSize: 18.sp, fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
