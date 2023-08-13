import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargeCardOrange extends StatelessWidget {
  const RechargeCardOrange({Key? key}) : super(key: key);

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
          child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,
            color: Colors.transparent,
          )),
        ),
        actions: [IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_forward_ios,
          color: Colors.black,
        ))],
        title: Text("شحن الرصيد",
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/orange.png",width: 100.w,height: 30.h,),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "رقم الهاتف",
                      hintStyle: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      suffixIcon: Icon(Icons.contact_phone,color: Colors.black54,)
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Row(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 5),
                      child: TextFormField(
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: "المبلغ المدفوع",
                          hintStyle: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,
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
                      padding: const EdgeInsets.only(right: 10,left: 5),
                      child: TextFormField(
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: "رصيد",
                          hintStyle: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),

                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width/1.9,
              decoration: BoxDecoration(
                color: Color(0xff3a66d3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text("شحن",style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold,
                    color: Colors.white


                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
