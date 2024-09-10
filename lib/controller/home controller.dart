import 'package:coffee_project/data/coffee_list.dart';
import 'package:coffee_project/model/coffee_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedLocation = 'Select a Location    '.obs;
  var searchController = TextEditingController();
  var filteredData = <CoffeeClass>[].obs;

  @override
  void onInit() {
    filteredData.value = allcoffee;
    super.onInit();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredData.value = allcoffee;
    } else {
      filteredData.value = allcoffee
          .where((coffee) =>
          coffee.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateLocation(String newLocation) {
    selectedLocation.value = newLocation;
  }
}
