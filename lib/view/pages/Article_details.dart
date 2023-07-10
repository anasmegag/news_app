import 'package:flutter/material.dart';
import 'package:football_app/model/Classes.dart';
import 'package:url_launcher/url_launcher.dart';


/*
changeble test 
seconde update
 */
class Details extends StatelessWidget {
  Details({Key? key, required this.article}) : super(key: key);

 final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text('article'),
        backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      ),
      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,


                
              ),
              Text(
                article.description,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              article.urlToImage == ''
                  ? SizedBox(
                      height: 50,
                      child: Row(
                        children: const [
                          Text(
                            "No Image",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 30),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.error,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    )
                  : Image.network(article.urlToImage),
              const SizedBox(
                height: 20,
              ),
              Text(
                article.content ?? '',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse(article.url);
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw 'cannot launch url';
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  child: const Text(
                    'more',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'written by : ${article.author} \n at: ${article.publishedAt}',
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
