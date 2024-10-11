import 'package:codelab2/app/modules/article_details/Views/article_detail_web_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/http_views/views/http_view.dart';
import '../modules/http_views/binding/http_binding.dart';
import '../modules/article_details/bindings/article_detail_binding.dart';
import 'package:codelab2/app/modules/article_details/Views/article_detail_view.dart';
part 'app_routes.dart';
class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.HTTP,
        page: () => const HttpView(),
        binding: HttpBinding()
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAILS,
      page: () => ArticleDetailPage(article: Get.arguments,),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
        name: _Paths.ARTICLE_DETAILS_WEBVIEW,
        page: () =>  ArticleDetailWebView(article: Get.arguments),
        binding: HttpBinding()
    ),
  ];
}