import 'package:coffee_project/controller/home%20controller.dart';
import 'package:coffee_project/data/coffee_list.dart';
import 'package:coffee_project/data/name_list.dart';
import 'package:coffee_project/goggle_fonts.dart';
import 'package:coffee_project/pages/coffee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  int selectedIndex = 0;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                  clipBehavior: Clip.none,
                children:[ Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  color: three,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location', style: myStyle(16, Colors.white)),
                      Row(
                        children: [
                          Obx(() => DropdownButton<String>(
                            value: homeController.selectedLocation.value,
                            dropdownColor: Colors.black87,
                            style: myStyle(16, Colors.white),
                            underline: Container(),
                            icon: Icon(Icons.arrow_drop_down_circle_sharp, color: Colors.white),
                            items: <String>['Select a Location    ', 'Paro', 'Dagana', 'Thimphu', 'Mongar']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              homeController.updateLocation(newValue!);
                            },
                          )),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.8,
                            child: TextFormField(
                              controller: homeController.searchController,
                              onChanged: (value) {
                                homeController.filterSearchResults(value);
                              },
                              style: myStyle(18, Colors.white),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search, color: Colors.white, size: 30),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: one
                            ),
                            child: Icon(Icons.filter_list, color: Colors.white,),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                  Gap(10),
                  Positioned(
                    left: 20,
                    bottom: -60,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: -23,
                                right: -10,
                                child: Container(
                                  height: 170,
                                  width: 200,
                                  child: Image.asset('assets/image/remove.png',fit: BoxFit.cover,),),
                              ),
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 30,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.red
                                        ),
                                        child: Center(child: Text('Promo', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,)))
                                    ),
                                    SizedBox(height: 20), // Space between text
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children:[ Container(
                                          height: MediaQuery.of(context).size.height*0.03,
                                          width: MediaQuery.of(context).size.width*0.4,
                                          decoration: BoxDecoration(
                                              color: three
                                          ),
                                      ),
                                        Positioned(
                                            top: -10,
                                            right: 5,
                                            child: Text('Buy one get', style: myStyle(24, Colors.white, FontWeight.bold),))
                                      ]
                                    ),
                                    SizedBox(height: 15), // Space between text
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children:[ Container(
                                          height: MediaQuery.of(context).size.height*0.03,
                                          width: MediaQuery.of(context).size.width*0.33,
                                          decoration: BoxDecoration(
                                              color: three
                                          ),
                                      ),
                                        Positioned(
                                            top: -10,
                                            right: 5,
                                            child:  Text('one FREE', style: myStyle(22, Colors.white, FontWeight.bold),)),
                                      ]
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
              Gap(80),
              Padding(
                padding: const EdgeInsets.all(9),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: name.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        bool isSelected = index == selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            //selectedIndex = index;
                          },
                          child: Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelected
                                  ? one // Color when selected
                                  : Colors.grey.withOpacity(0.3), // Color when not selected
                            ),
                            child: Center(
                                child: Text("${name[index].name}", style: myStyle(15,isSelected ? Colors.white : Colors.black, FontWeight.bold),
                                )
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Obx(() => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: homeController.filteredData.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(CoffeeDetailPage(coffee: allcoffee[index],));
                        },
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage("${homeController.filteredData[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 23,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: three,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.yellow,size: 16,),
                                            Text(
                                              "${homeController.filteredData[index].rating}",
                                              style: myStyle(15, Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${homeController.filteredData[index].name}",
                                  style: myStyle(22, Colors.black, FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${homeController.filteredData[index].name}",
                                  style: myStyle(18),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ ${homeController.filteredData[index].price}",
                                      style: myStyle(18,Colors.black,FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: one,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CoffeeDetailPage(coffee: homeController.filteredData[index]),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
