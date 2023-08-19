// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:search_from_list_getx/Model/movie.dart';

class SearchFieldController extends GetxController {
  RxInt check = 10.obs;

  RxString here = 'hello'.obs;

  void herefun(value) {
    here = value;
  }

  RxList<Movies> displaylist = List<Movies>.from(Movies.moviessList).obs;

  search(String value) {
    displaylist = RxList.from(Movies.moviessList.where((element) =>
        element.movieName.toLowerCase().contains(value.toLowerCase())));

    // Movies.moviessList
    //     .where((element) =>
    //         element.movieName.toLowerCase().contains(value.toLowerCase()))
    //     .toList();
    print(displaylist.length);
    displaylist.refresh();
    return displaylist;
  }
}
