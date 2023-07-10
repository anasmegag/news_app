import 'package:flutter/material.dart';
import 'package:football_app/controller/Controll.dart';
import 'package:football_app/view/widgets/element.dart';
import 'package:get/get.dart';

import '../../model/Classes.dart';


// ignore: must_be_immutable
class SetArticles extends StatelessWidget {
  SetArticles({Key? key, required this.category, required this.country})
      : super(key: key);
  String country;
  String category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controll>(builder: (controller) {
      return FutureBuilder(
        future: controller.getInfo(country: country, category: category),
        builder: (BuildContext context, AsyncSnapshot<Articles> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (BuildContext ctx, int index) {
                  if (snapshot.data!.articles != []) {
                    return Elements(
                      article: snapshot.data!.articles[index],
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'No, Articles here',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(Icons.error_outline)
                        ],
                      ),
                    );
                  }
                });
          } else {
            return const CircularProgressIndicator(
              color: Colors.yellowAccent,
            );
          }
        },
      );
    });
  }
}
