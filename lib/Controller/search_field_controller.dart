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

  searching(String value) {
    if (value.isEmpty) {
      print('is empty');
      return displaylist.value = Movies.moviessList;
    } else {
      return displaylist.value = displaylist
          .where((element) =>
              element.movieName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  void deleting(index) {
    displaylist.removeAt(index);
  }

  void adding() {
    Movies.moviessList.add(Movies(1, movienamecontroller.text,
        int.parse(releasecontroller.text), imageurlcontroller.text));
    movienamecontroller.clear();
    releasecontroller.clear();
    imageurlcontroller.clear();
    Get.back();
    displaylist.refresh();
  }

  void reseting() {
    displaylist.value = Movies.moviessList.obs;
  }

  // addform
  void addform() {
    Get.defaultDialog(
        title: 'Add',
        onCancel: () => Get.back(),
        onConfirm: () {
          adding();
        },
        content: Column(
          children: [
            tfield(movienamecontroller, 'Movie Name'),
            tfield(releasecontroller, 'Releasing Year'),
            tfield(imageurlcontroller, 'Image Url'),
          ],
        ));
  }
}
