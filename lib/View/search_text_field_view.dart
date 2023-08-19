import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_from_list_getx/Controller/search_field_controller.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SearchFieldController());
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: TextField(
              onChanged: (value) => controller.search(value),
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          //list tile
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.displaylist.length,
                  //controller.displaylist.length,
                  itemBuilder: (context, index) {
                    print(
                        'this is from UI Length ${controller.displaylist.length}');
                    var data = controller.displaylist[index];

                    return ListTile(
                      title: Text(data.movieName),
                      subtitle: Text(data.releasingYear.toString()),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.imageUrl)),
                    );
                  }))),
          Obx(() => Text(controller.here.value))
        ],
      ),
    );
  }
}
