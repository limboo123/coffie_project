import 'package:coffee_project/goggle_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class DeliveryTrackingScreen extends StatefulWidget {
  @override
  _DeliveryTrackingScreenState createState() => _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState extends State<DeliveryTrackingScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.settings),
          Gap(10)
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image/coffee_location.jpg'),fit: BoxFit.cover)
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '10 minutes left',
                    style: myStyle(18, Colors.black,FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Delivery to Jl. Kpg Sutoyo',style: myStyle(14,Colors.grey,FontWeight.bold),),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Divider(),
                  Gap(10),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: ListTile(
                      leading:Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Image(image: AssetImage("assets/image/order.png"))),
                      title: Text('Delivered your order',style: myStyle(18,Colors.black,FontWeight.bold),),
                      subtitle: Text(
                          'We will deliver your goods as soon as possible.',style: myStyle(14,Colors.grey,FontWeight.bold),),
                    ),
                  ),
                  Gap(20),
                  ListTile(
                      leading:Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:DecorationImage(image: AssetImage("assets/image/pp.jpg"),fit: BoxFit.cover,),
                          ),
                      ),
                    title: Text('Sophia Ellis',style: myStyle(18,Colors.black,FontWeight.bold),),
                    subtitle: Text('Personal Courier',style: myStyle(14,Colors.grey,FontWeight.bold),),
                    trailing:InkWell(
                      onTap: (){
                        launchUrl(
                          Uri.parse("tel:+975 77665544"),
                        );
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Image(image: AssetImage("assets/image/call.png"))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}