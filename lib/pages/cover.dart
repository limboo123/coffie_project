import 'package:coffee_project/goggle_fonts.dart';
import 'package:coffee_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
class CoverPages extends StatelessWidget {
  CoverPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/Craft.jpg'),fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Gap(490),
                      Text("Coffee", style: myStyle(35, Colors.white, FontWeight.bold),),
                      Text(" is a morning hug ",style: myStyle(30, Colors.white, FontWeight.bold),),
                    ],
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Another day, another cup of coffee",style: myStyle(20,Colors.white,FontWeight.bold),),
                ),
                Gap(20),
                InkWell(
                  onTap: (){
                    Get.to(HomePage());
                  },
                  child: Card(
                      elevation: 6,
                      child: Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: one,
                        ),
                        child: Center(child: Text("Enjoy Your Coffee",style: myStyle(23, Colors.white))),
                      )
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

