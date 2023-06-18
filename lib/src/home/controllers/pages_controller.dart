import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  var page = "Home".obs;
  var index = 0.obs;
  var vazio = "".obs;


  add(int dados) {
  // page.value = dados;
   index.value= dados;
   print("index ${index.value}");

    update();
  }

}
