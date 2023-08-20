// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_from_list_getx/Model/movie.dart';
import 'package:search_from_list_getx/View/search_text_field_view.dart';

class SearchFieldController extends GetxController {
  //controller
  TextEditingController movienamecontroller = TextEditingController();
  TextEditingController releasecontroller = TextEditingController();
  TextEditingController imageurlcontroller = TextEditingController();

  var displaylist = Movies.moviessList.obs;

  void searching(String value) {
    displaylist.value = Movies.moviessList
        .where((element) =>
            element.movieName.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  void deleting(index) {
    displaylist.removeAt(index);
  }

  void adding (){
    displaylist.add(Movies(1, movienamecontroller.text, releasecontroller.text.to, ''));
  }

  void reseting() {
    displaylist.value = Movies.moviessList.obs;
    Get.defaultDialog(
        title: 'Add',
        onCancel: () => Get.back(),
        onConfirm: () => ,
        content: Column(
          children: [
            tfield(movienamecontroller, 'Movie Name'),
            tfield(releasecontroller, 'Releasing Year'),
            tfield(imageurlcontroller, 'Image Url'),
          ],
          
        ));
  }
}
