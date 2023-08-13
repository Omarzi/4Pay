import 'package:cash_app/features/home_layout/presentaion/views/home_internet/elfagr_bill.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_internet/home_internet_we.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_internet/noor_bill.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_internet/orange_dsl.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_internet/vodafone_dsl.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_app_bar.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_card_in_recharge.dart';
import 'package:flutter/material.dart';
import 'add_package_we.dart';
import 'etisalat_dsl.dart';
import 'home_internet_bills.dart';

List text = ['فواتير التليفون الأرضي', 'انترنت منزلي WE', 'باقة اضافية WE',"اتصالات DSL",'فودافون DSL','اورانج DSL','فواتير الفجرDSL','فواتير النور DSL',];

List<String> images = [
  "assets/images/we.png",
  "assets/images/etisalat.png",
  "assets/images/vodafone2.jpeg",
  "assets/images/orange2.png",
  "assets/images/elfagr.png",
  "assets/images/noor.png",

];

class HomeInternetView extends StatelessWidget {
  const HomeInternetView({Key? key}) : super(key: key);

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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeInternetBills(
                          images[0],text[0]
                        )));

                      }, images: images[0], items: text[0]),
                      SizedBox(width: 10,),
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeInternetWe(images[0], text[1])));

                      }, images: images[0], items: text[1]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPackageWe(images[0],text[2])));

                      }, images: images[0], items: text[2]),
                      SizedBox(width: 10,),

                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EtisalatDsl(images[1],text[3])));

                      }, images: images[1], items: text[3]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VodafoneDsl(images[2], text[4])));

                      }, images: images[2], items: text[4]),
                      SizedBox(width: 10,),

                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrangeDsl(images[3], text[5])));

                      }, images: images[3], items: text[5]),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ItemInRecharge(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ElfagrBill(images[4], text[6])));

                      }, images: images[4], items: text[6]),
                      SizedBox(width: 10,),

                      ItemInRecharge(
                          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoorBill(images[5], text[7])));

                      }, images: images[5], items: text[7]),
                    ],
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }

}
