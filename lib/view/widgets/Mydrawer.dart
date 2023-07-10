import 'package:flutter/material.dart';
import 'package:football_app/controller/Controll.dart';
import 'package:football_app/view/pages/HomePage.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  Controll c = Get.put(Controll(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      child: GetBuilder<Controll>(
          init: Controll(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
               const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text(
                    'Select the country and the type of news you want',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 3),
                    color: const Color.fromARGB(255, 54, 54, 54),
                  ),
                  child: Column(
                    children: [
                      const Text('Country',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          elevation: 0,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          dropdownColor: const Color.fromARGB(255, 47, 47, 47),
                          iconEnabledColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                          onChanged: (val) {
                            c.setCountry(val.toString());
                            
                          },
                          value: c.current_country.name,
                          items: c.countries
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  child: Text(e.name),
                                  value: e.name,
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 3),
                    color: const Color.fromARGB(255, 54, 54, 54),
                  ),
                  child: Column(
                    children: [
                      const Text('Category',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          elevation: 0,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          dropdownColor: const Color.fromARGB(255, 47, 47, 47),
                          iconEnabledColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                          onChanged: (val) {
                            c.setCategory(val!);
                          },
                          value: c.current_category,
                          items: c.categories
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(240, 220, 130, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      Get.offAll(()=>HomePage(category: controller.current_category, country: controller.current_country.address));
                    },
                    child: const Text(
                      "Get news",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
