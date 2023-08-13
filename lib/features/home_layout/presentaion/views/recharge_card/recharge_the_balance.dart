
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_card_etisalat.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_card_vodafone.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_card_we.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_the_balance.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/rechrge_card_orange.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_app_bar.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_card_in_recharge.dart';

import 'package:flutter/material.dart';

List text = ['Etisalat', 'Vodafone', 'We',"Orange"];

List<String> images = [
 "assets/images/etisalat.png",
 "assets/images/vodafone.png",
 "assets/images/we.png",
 "assets/images/orange.png",

];

class RechargeTheBalance extends StatelessWidget {
  const RechargeTheBalance({Key? key}) : super(key: key);

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
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeCardEtisalat()));

                    }, images: images[0], items: text[0]),
                    SizedBox(width: 10,),
                    ItemInRecharge(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeCardVodafone()));

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeCardWe()));

                    }, images: images[2], items: text[2]),
                    SizedBox(width: 10,),

                    ItemInRecharge(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeCardOrange()));

                    }, images: images[3], items: text[3]),
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
