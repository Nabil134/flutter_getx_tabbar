import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController;
  //var tapIndex=0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController=TabController(length: 2, vsync: this);
    tabController.addListener(() {
      update();
      // tapIndex.value=tabController.index;
      //update();
    });
  }
  @override
  void onClose() {
    tabController.dispose();
    // TODO: implement onClose
    super.onClose();
  }

}