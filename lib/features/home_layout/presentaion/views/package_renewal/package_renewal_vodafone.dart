// import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageRenewalVodafone extends StatefulWidget {

  @override
  State<PackageRenewalVodafone> createState() => _ShippingCardVodafoneState();
}

class _ShippingCardVodafoneState extends State<PackageRenewalVodafone> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;

  var _contactPhone=TextEditingController();
  GlobalKey<FormState>key =GlobalKey();
  List<String> list = [
    "orange Package 10",
    "orange Package 20",
    "orange Package 30",
    "orange Package 40",
  ];

  // Option 2
  String? selectItem;
  String? newf;
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
        title: Text("اختر الباقة",
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
                  "assets/images/vodafone2.png", width: 100.w, height: 80.h,),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text("اختر الباقة التي تريد تجديدها",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  elevation: 1.sign,
                  isExpanded: true,
                  hint: Text('اختر الباقة',
                    style: TextStyle(
                        fontSize: 18.sp
                    ),
                  ),
                  // Not necessary for Option 1
                  value: selectItem,
                  onChanged: (newValue) {
                    setState(() {
                      selectItem = newValue;
                      newf=newValue;
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
            SizedBox(height: 3.h,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: Form(
                  key: key,
                  child: TextFormField(
                    controller: _contactPhone,
                    validator: (text){
                      if(text!.length < 8){
                        return "برجاء ادخال رقم هاتف صحيح من 11 رقم";
                      }
                    },
                    decoration: InputDecoration(
                        errorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 0.3.w, color: Colors.red),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        hintText: "رقم الهاتف",
                        hintStyle: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () async {
                              Contact? contact = await _contactPicker.selectContact();
                              setState(() {
                                _contact = contact;
                                _contactPhone.text=_contact!.phoneNumbers.toString();
                              });
                            },
                            child: Icon(Icons.contact_phone,color: Colors.black54,))
                    ),
                  ),
                ),
              ),
            ),
            _contactPhone.text.isEmpty?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              child: GestureDetector(
                onTap: () {
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
                    color: Colors.grey[400],
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
            ):  Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              child: GestureDetector(
                onTap: () {
                  if(key.currentState!.validate()){
                    openAlertBox();
                  }
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
                        Image.asset("assets/images/vodafone2.png", width: 25.w,
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
                              Text(" فئة الكرت  ${newf}   ",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Text("شركة فودافون",
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
                        Container(
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