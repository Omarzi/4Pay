import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/shipping_card/show_shipping_card/orange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShippingCardOrange extends StatefulWidget {
  @override
  State<ShippingCardOrange> createState() => _ShippingCardVodafoneState();
}

class _ShippingCardVodafoneState extends State<ShippingCardOrange> {
  List<String> list = [
    "أورانج-2.5ج",
    "أورانج-5ج-اكسترا",
    "أورانج-9ج-اكسترا",
    "أورانج-10ج",
    "أورانج-13.5ج",
    "أورانج-15ج",
    "أورانج-18.5ج",
    "أورانج-20ج",
    "أورانج-25ج",
    "أورانج-28ج",
    "أورانج-35ج",
    "أورانج-42ج",
    "أورانج-50ج",
    "أورانج-100ج",
  ];

  // Option 2
  String? selectItem;
  String? newItem;

  // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: Directionality(
          textDirection: TextDirection.rtl,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.transparent,
              )),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ))
        ],
        title: Text(
          "طلب الكرت",
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/orange.png",
                  width: 57.w,
                  height: 30.h,
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                "ادخل فئة الكرت السعرية التي تريدها",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  elevation: 1.sign,
                  isExpanded: true,
                  hint: Text(
                    'الفئة :',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  // Not necessary for Option 1
                  value: selectItem,
                  onChanged: (newValue) {
                    setState(() {
                      selectItem = newValue;
                      newItem = newValue;
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              child: GestureDetector(
                onTap: () {
                  openAlertBox();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: AppConstants.redColor,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Center(
                    child: Text(
                      "طلب",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
            content: Container(
              width: 180.w,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'تفاصيل الطلب',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/orange.png",
                          width: 25.w,
                          height: 10.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تأكد من تفاصيل الطلب لن تتمكن من ارجاع الكرت بمجردان يظهر لك :",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                " فئة الكرت  ${newItem}   ",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "شركة أورانج",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowOrangeCard(newItem!)));
                            // openAlertBoxloading();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                "تأكيد",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.7.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              color: AppConstants.redColor,
                            ),
                            child: Center(
                              child: Text(
                                "الغاء",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  openAlertBoxloading() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
            content: Container(
              width: 180.w,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //
                    // Center(
                    //   child: LoadingAnimationKit.fourCirclePulse(
                    //     circleColor: Colors.blue, //The color of the circles
                    //     dimension: 48.0, // The size of the widget.
                    //     turns: 2, //Turns in each loop
                    //     loopDuration: const Duration(seconds: 1), // Duration of each loop
                    //     curve: Curves.linear, //Curve of the animation
                    //   ),
                    // ),
                    Text(
                      "العودة للصفحة الرئيسية",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    LoadingAnimationWidget.stretchedDots(
                      color: Colors.blue,
                      size: 50,
                    ),
                  ]),
            ),
          );
        });
  }
}
