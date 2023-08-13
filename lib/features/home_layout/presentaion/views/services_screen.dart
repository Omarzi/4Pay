import 'package:cash_app/constant.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:cash_app/features/home_layout/presentaion/managers/air_charge/air_charge_cubit.dart';
import 'package:cash_app/features/home_layout/presentaion/views/home_internet/home_internet_view.dart';
import 'package:cash_app/features/home_layout/presentaion/views/package_renewal/pachage_renewal.dart';
import 'package:cash_app/features/home_layout/presentaion/views/recharge_card/recharge_the_balance.dart';
import 'package:cash_app/features/home_layout/presentaion/views/shipping_card/shipping_card_view.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_app_bar.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_drawer.dart';
import 'package:cash_app/features/home_layout/presentaion/views/widgets/custom_item_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mobile_bills/mobile_bill_view.dart';

List items = [
  'شحن الرصيد',
  'كرت شحن',
  'شحن الفكه',
  'تجديد الباقة',
  'فواتير الموبيل',
  'الانترنت والارضي',
  'شحن المحافظ',
  'التعليم',
  'المرافق العامه',
  'خدمات التأمين',
];

List<IconData> icons = [
  Icons.send,
  Icons.add_card_rounded,
  Icons.add_card_rounded,
  Icons.signal_cellular_alt,
  Icons.phone_iphone,
  Icons.wifi,
  Icons.multiple_stop,
  Icons.school_rounded,
  Icons.bolt_outlined,
  Icons.person,
];

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int index = 0;

  @override
  void initState() {
    BlocProvider.of<AirChargeCubit>(context).sendCharge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AirChargeCubit()..sendCharge(),
      child: BlocBuilder<AirChargeCubit, AirChargeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<AirChargeCubit>(context);

          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: const PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: CustomAppBar(text: 'لخدمات الدفع الألكتروني'),
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return BlocProvider.of<AirChargeCubit>(context).sendCharge();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    customChargeNow(cubit.charge.toString() ?? '...'),
                    const SizedBox(height: 25),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RechargeTheBalance(),
                                    ),
                                  );
                                },
                                iconData: icons[0],
                                items: items[0]),
                            SizedBox(
                              width: 10,
                            ),
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShippingCardView(),
                                    ),
                                  );
                                },
                                iconData: icons[1],
                                items: items[1]),
                          ],
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PackageRenewalView(),
                                    ),
                                  );
                                },
                                iconData: icons[2],
                                items: items[2]),
                            SizedBox(
                              width: 10,
                            ),
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShippingCardView(),
                                    ),
                                  );
                                },
                                iconData: icons[3],
                                items: items[3]),
                          ],
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MobileBillsView(),
                                    ),
                                  );
                                },
                                iconData: icons[4],
                                items: items[4]),
                            SizedBox(
                              width: 10,
                            ),
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeInternetView(),
                                    ),
                                  );
                                },
                                iconData: icons[5],
                                items: items[5]),
                          ],
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RechargeTheBalance(),
                                    ),
                                  );
                                },
                                iconData: icons[6],
                                items: items[6]),
                            SizedBox(
                              width: 10,
                            ),
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShippingCardView(),
                                    ),
                                  );
                                },
                                iconData: icons[7],
                                items: items[7]),
                          ],
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RechargeTheBalance(),
                                    ),
                                  );
                                },
                                iconData: icons[8],
                                items: items[8]),
                            SizedBox(
                              width: 10,
                            ),
                            ItemInBody(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShippingCardView(),
                                    ),
                                  );
                                },
                                iconData: icons[9],
                                items: items[9]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customChargeNow(String charge) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 2, top: 20),
      elevation: 5,
      shadowColor: AppConstants.primaryColor.withOpacity(.6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'الرصيد الحالي المتاح',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              charge,
              // MyConfigCach.getInt(key: MyConfigCacheKeys.charge).toString(),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
