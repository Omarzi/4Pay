import 'package:cash_app/constant.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_the_balance.dart';
import 'package:flutter/material.dart';

class ItemInRecharge extends StatelessWidget {
  void Function()? onTap;

  final String images;
  final String items;
  ItemInRecharge({
    Key? key,
    required this.onTap,
    required this.images,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                Image.asset(images,
                  width: 100,
                  height: 120,
                ),
                Text(
                  items,
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
      ),
    );
  }
}
