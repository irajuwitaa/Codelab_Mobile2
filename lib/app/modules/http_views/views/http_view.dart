import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/http_controller.dart';
import '../../components/card_article.dart';

class HttpView extends GetView<HttpController> {
  const HttpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with Gradient
      appBar: AppBar(
        title: const Text(
          'HTTP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.purpleAccent,
      ),
      // Body content
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            // Custom Loading Indicator with Animation
            child: SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 6.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          );
        } else {
          // Enhanced ListView with padding and smooth transitions
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                var article = controller.articles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CardArticle(article: article),
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}