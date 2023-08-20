import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_from_list_getx/Controller/search_field_controller.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SearchFieldController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('A P P'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => controller.reseting(),
                      icon: const Icon(Icons.refresh)),
                  IconButton(
                      onPressed: () => controller.addform(),
                      icon: const Icon(Icons.add))
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextField(
                autofocus: false,
                onChanged: (value) => controller.searching(value),
                decoration: const InputDecoration(
                  isDense: false,
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
                      var data = controller.displaylist[index];
                      return ListTile(
                        title: Text(data.movieName),
                        subtitle: Text(data.releasingYear.toString()),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(data.imageUrl)),
                        trailing: IconButton(
                            onPressed: () => controller.deleting(index),
                            icon: const Icon(Icons.delete)),
                      );
                    }))),

            Obx(() => Text(controller.displaylist.length.toString()))
          ],
        ),
      ),
    );
  }
}

Widget tfield(TextEditingController controller, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: TextField(
      
      controller: controller,
      decoration: InputDecoration(
        isDense: false,
        hintText: text,
        border: InputBorder.none,
      ),
    ),
  );
}
