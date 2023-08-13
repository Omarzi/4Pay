import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/services_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';

class VodafoneDsl extends StatefulWidget {
  String image;
  String text;

  VodafoneDsl(this.image, this.text);

  @override
  State<VodafoneDsl> createState() => _HomeInternetBillsState();
}

class _HomeInternetBillsState extends State<VodafoneDsl> {
  @override
  List<String> list = [
    "باقة اضافية 20جيجا-34.2ج",
    "باقةاضافية 50جيجا-68.4ج",
    "باقة اضافية 100جيجا-114ج",
    "باقة اضافية 400جيجا-228ج",
  ];

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
                          padding:  EdgeInsets.symmetric(vertical: 0.5.h),
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
                              hintText: "رقم الأرضي",
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.sp)
                            ),
                            height: MediaQuery.of(context).size.height/13,

                            child: DropdownButton(
                              isExpanded: true,
                              hint: Center(
                                child: Text(
                                  '40االغرب',
                                  style: TextStyle(fontSize: 20.sp,color: Colors.black),
                                ),
                              ),
                              // Not necessary for Option 1
                              value: selectItem,
                              onChanged: (newValue) {
                                setState(() {
                                  selectItem = newValue;
                                  newf = newValue;
                                });
                              },
                              items: list.map((item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  value: item,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
              child: Container(
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.sp)),
                child: DottedBorder(
                  color: AppConstants.primaryColor,
                  strokeWidth: 1,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text("المبلغ",style: TextStyle(fontSize: 25.sp,color: Colors.grey),),
                      ),
                    ],
                  )
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
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
              child: Container(
                height: MediaQuery.of(context).size.height/9,
                width: MediaQuery.of(context).size.width,
               color: Colors.grey[300],
                child: DottedBorder(
                    color: AppConstants.primaryColor,
                    strokeWidth: 1,
                    child: Container(

                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 1.h),
                            child: Text("الاستعلام عن الفاتوره اوالاستهلاك من\n اي خط فودافون اطلب *2828#",style: TextStyle(fontSize: 15.sp,color: Colors.black),),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
