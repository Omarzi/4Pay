import 'package:cash_app/features/home_layout/presentaion/views/shipping_card/show_shipping_card/we.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingCardWe extends StatefulWidget {

  @override
  State<ShippingCardWe> createState() => _ShippingCardVodafoneState();
}

class _ShippingCardVodafoneState extends State<ShippingCardWe> {

  List<String> list = [
   "المصرية-5ج",
   "المصرية-7ج",
   "المصرية-9ج",
   "المصرية-10ج",
   "المصرية-15ج",
   "المصرية-25ج",
   "المصرية-30ج",
   "المصرية-40ج",
   "المصرية-50ج",
   "المصرية-60ج",
   "المصرية-75ج",
   "المصرية-100ج",
   "المصرية-150ج",
  ];

  // Option 2
  String? selectItem;
  String? newItem=" ";
  // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading:
        Directionality(
          textDirection: TextDirection.rtl,
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_forward_ios,
            color: Colors.transparent,
          )),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_forward_ios,
          color: Colors.black,
        ))
        ],
        title: Text("طلب الكرت",
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/we.png", width: 57.w, height: 30.h,),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text("ادخل فئة الكرت السعرية التي تريدها",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  elevation: 1.sign,
                  isExpanded: true,
                  hint: Text('الفئة :',
                    style: TextStyle(
                        fontSize: 18.sp
                    ),
                  ),
                  // Not necessary for Option 1
                  value: selectItem,
                  onChanged: (newValue) {
                    setState(() {
                      selectItem = newValue;
                      newItem=newValue;
                    });
                  },
                  items: list.map((item) {
                    return DropdownMenuItem(
                      child: new Text(item,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 16,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.1,
                  decoration: BoxDecoration(
                    color: Color(0xffdc0000),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Center(
                    child: Text("طلب", style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,
                        color: Colors.white


                    ),),
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
                    Text('تفاصيل الطلب',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/we.png", width: 25.w,
                          height: 10.h,),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تأكد من تفاصيل الطلب لن تتمكن من ارجاع الكرت بمجردان يظهر لك :",
                                style: TextStyle(

                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Text(" فئة الكرت  ${newItem}   ",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Text("شركة وي",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowWeCard(newItem!)));
                          },
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 17,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 3.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: Colors.green
                            ),
                            child: Center(
                              child: Text("تأكيد",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1.7.w,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 17,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 3.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: Color(0xffdc0000)
                            ),
                            child: Center(
                              child: Text("الغاء",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),);
        });
  }

}