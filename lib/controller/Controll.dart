import 'package:football_app/model/Models.dart';
import 'package:football_app/view/pages/Article_details.dart';
import 'package:get/get.dart';

import '../model/Classes.dart';

class Controll extends GetxController {
  //this function made to get more information on the article
  Navigate(Article article) {
    Get.to(() => Details(article: article));
  }

  //this function is made to get the articles based on a specific category and specific country
  Future<Articles> getInfo({String? country,String ?category}) async {
    GlobalModel model = GlobalModel();
    Articles articles = await model.getnews(country: country ?? 'us',category: category??'general');
    return articles;
  }

  // we will make a map to choose the country then the function

  Country current_country = Country(address: 'us', name: 'Usa');

  List<Country> countries = [
    Country(name: 'Usa', address: 'us'),
    Country(name: 'Russia', address: 'ru'),
    Country(name: 'India', address: 'in'),
    Country(name: 'Australia', address: 'au'),
    Country(name: 'Germany', address: 'ge'),
    Country(name: 'France', address: 'fr'),
    Country(name: 'Chaina', address: 'ch'),
    Country(name: 'Canada', address: 'ca'),
    Country(name: 'Japon', address: 'jp'),
    Country(name: 'Mexico', address: 'mx'),
    Country(name: 'Egypte', address: 'eg'),
  ];

  setCountry(String name) {
    for (var i = 0; i < countries.length; i++) {
      if (countries[i].name == name) {
        current_country = countries[i];
        break;
      }
    }
    update();
  }

  //this part is to choose the category
  String current_category = 'general';
  List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'
  ];
  setCategory(String name){
    current_category=name;
    update();
  }
}
