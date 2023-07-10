import 'package:flutter/material.dart';
import 'package:football_app/controller/Controll.dart';
import 'package:football_app/view/widgets/setNews.dart';
import 'package:get/get.dart';

import '../widgets/Mydrawer.dart';

class HomePage extends StatelessWidget {
   HomePage({
    Key? key,
    required this.category,
    required this.country

  }) : super(key: key);
final  String category;
final  String country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.defaultDialog(content:const Text("made by Anas Megag"),title: 'News App');
          }, icon:const Icon(Icons.info_outline))
        ],
        backgroundColor: const Color.fromARGB(255, 54, 54, 54),
        elevation: 0,
        title: const Text('News App'),
        centerTitle: true,
      ),
      body: GetBuilder<Controll>(
        init: Controll(),
        builder: (controller) {
          return  Padding(
            padding:const EdgeInsets.all(10),
            child: Center(child: SetArticles(category: category,country:country ,)),
          );
        },
      ),
    );
  }
}
