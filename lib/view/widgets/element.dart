import 'package:flutter/material.dart';
import 'package:football_app/controller/Controll.dart';
import 'package:football_app/model/Classes.dart';
import 'package:football_app/view/pages/Article_details.dart';
import 'package:get/get.dart';

class Elements extends StatelessWidget {
  Elements({Key? key, required this.article}) : super(key: key);
  Article article;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controll>(
      init: Controll(),
      builder: (controller) {
        return InkWell(
          onTap: (){controller.Navigate(article);},
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SafeArea(
                    child: SizedBox(
                      width: 130,
                      height: 130,
                      child: article.urlToImage!=''?Image.network(article.urlToImage):Icon(Icons.broken_image),
                    ),
                  ),
                  const SizedBox(width: 10,),
        
                  Expanded(
                    flex: 1,
                    child: Text(article.title,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))
                  
        
                  
                ],
              )),
        );
      }
    );
  }
}
