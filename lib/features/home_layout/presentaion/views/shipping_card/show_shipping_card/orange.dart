import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowOrangeCard extends StatelessWidget {

  String newItem;
  ShowOrangeCard(this.newItem);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        centerTitle: true,

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: AppConstants.redColor,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/orange.png",width: 30.w,height: 13.h,color: Colors.white,),
                        ],
                      ),
                      Text("فئة الكرت:  $newItem",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Text("الكرت: 1234 567 89 123 45 ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            elevation: 2.sp,
                            child: Container(
                              height: MediaQuery.of(context).size.height/17,
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(9.sp),
                                    child: Text("طباعة",
                                      style: TextStyle(
                                        fontSize: 12.sp,

                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w,),
                                  Icon(Icons.print,color: Colors.black,size: 15.sp,),

                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Text("تعليمات",style:
            TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700
            )
              ,),
            Text("احرص علي أن يرى العميل فقطط الكرت.",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
            Text("لايمكن استعمال الكرت اكثر من مرة واحدة. ",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
            Text("لايمكن ارسال او بيع الكر لأكثر من عميل واحد. ",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
            Text("بمجرد الخروج من تلك النافذة لن يأتي نفس الكرت مرة اخري فاحرص علي طباعته اولا.",textAlign:TextAlign.end,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
            Text("في حالة عدم عمل الكرت تحدث لخدة العملاء.",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),

            Padding(
              padding: EdgeInsets.only(top: 13.h,left: 2.w,right: 2.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayoutScreen()));
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
                    child: Text("العودة للرئيسيه", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold,
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
}
