import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/cash_egypt.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/company_orange.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/mobile_bill_egypt.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/mobile_bill_etisalat.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/mobile_bill_orange.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/mobile_bill_vodafone.dart';
import 'package:cash_app/features/home_layout/presentaion/views/mobile_bills/mobile_etisalat.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_app_bar.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_card_in_recharge.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

List text = ['فواتير موبيل فودافون', 'فواتير موبيل اتصالات', 'فواتير موبيل اورانج',"فواتير موبيل المصرية",'اورانج شركات','موبيل اتصالات(جزئي)','تحصيلات شركةاتصالات'];

List<String> images = [
  "assets/images/vodafone2.jpeg",
  "assets/images/etisalat.png",
  "assets/images/orange2.png",
  "assets/images/we.png",
  "assets/images/cash2.png",
];

class MobileBillsView extends StatelessWidget {
  const MobileBillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(text: 'لخدمات الدفع الألكتروني'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              // customChargeNow(),
              const SizedBox(height: 25),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileBillVodafone(images[0],text[0]
                        )));

                      }, images: images[0], items: text[0]),
                      SizedBox(width: 10,),
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileBillEtisalat(images[1], text[1])));

                      }, images: images[1], items: text[1]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileBillOrange(images[2],text[2])));

                      }, images: images[2], items: text[2]),
                      SizedBox(width: 10,),

                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MobillBillEgypt(images[3],text[3])));

                      }, images: images[3], items: text[3]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyOrange(images[2], text[4])));

                      }, images: images[2], items: text[4]),
                      SizedBox(width: 10,),

                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MobillEtisalat(images[3], text[5])));

                      }, images: images[3], items: text[5]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CashEgypt(images[4], text[6])));

                },
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                      Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        elevation: 5,
                        shadowColor: AppConstants.primaryColor.withOpacity(.4),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height/4.7,
                          width: MediaQuery.of(context).size.width/2.3,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(images[4],
                                  width: 100,
                                  height: 120,
                                ),
                                Text(
                                  text[6],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                        // ItemInRecharge(onTap: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>CashEgypt(images[4], text[6])));
                        //
                        // }, images: images[4], items: text[6]),
                      ],
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
