import 'package:cash_app/features/home_layout/presentaion/managers/air_charge/air_charge_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class RechargeCardVodafone extends StatefulWidget {
  RechargeCardVodafone({Key? key}) : super(key: key);

  @override
  State<RechargeCardVodafone> createState() => _RechargeCardVodafoneState();
}

class _RechargeCardVodafoneState extends State<RechargeCardVodafone> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();

  var _contactPhone = TextEditingController();

  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController chargeEditingController = TextEditingController();
  TextEditingController chargePaidEditingController = TextEditingController();

  Contact? _contact;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AirChargeCubit, AirChargeState>(
      listener: (context, state) {
        if (state is AirChargeVodafoneSuccessState) {
          SnackBar snackBar =
              const SnackBar(content: Text('تمت عملية الارسال بنجاح'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is AirChargeVodafoneErrorState) {
          SnackBar snackBar = const SnackBar(content: Text('فشلت عملية الارسال'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            leading: Directionality(
              textDirection: TextDirection.rtl,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.transparent,
                  )),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ))
            ],
            title: Text(
              "شحن الرصيد",
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/vodafone2.png",
                      width: 300,
                      height: 170,
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: phoneEditingController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: "رقم الهاتف",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                print("1111111111");
                                Contact? contact =
                                    await _contactPicker.selectContact();
                                setState(() {
                                  _contact = contact;
                                  _contactPhone.text =
                                      _contact!.phoneNumbers!.first;
                                  print("2222222222");
                                });
                              },
                              child: const Icon(
                                Icons.contact_phone,
                                color: Colors.black54,
                              ))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: TextFormField(
                            controller: chargePaidEditingController,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "المبلغ المدفوع",
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
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 5),
                          child: TextFormField(
                            controller: chargeEditingController,
                            onChanged: (value) {
                              setState(() {
                                chargePaidEditingController.text =
                                    ((int.parse(chargeEditingController.text) *
                                                1.43)
                                            .floor())
                                        .toString();
                              });
                            },
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "رصيد",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    ///
                    BlocProvider.of<AirChargeCubit>(context).airChargeVodafone(
                      int.parse(chargePaidEditingController.text),
                      phoneEditingController.text,
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 1.9,
                    decoration: BoxDecoration(
                      color: const Color(0xff3a66d3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: state is AirChargeVodafoneLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              "شحن",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
