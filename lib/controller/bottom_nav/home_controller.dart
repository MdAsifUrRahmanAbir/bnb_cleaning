import '../../utils/basic_widget_imports.dart';

class HomeController extends GetxController{

  // final ScrollController scrollController = ScrollController();
  RxBool showArrow = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   scrollController.addListener(() {
  //     // print(scrollController.position.atEdge);
  //     if (scrollController.position.atEdge) {
  //       if (scrollController.position.pixels == 0) {
  //           showArrow.value = true;
  //       } else {
  //           showArrow.value = false;
  //       }
  //     } else {
  //         showArrow.value = false;
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  List type = [
    "HOW TO MAKE AN ORDER",
    "HOW TO ORDER AIRBNB CLEANING SERVICES",
    "HOW TO ORDER (ONLY) LINEN HIRE",
    "HOW TO ORDER MID STAY SHORT LET CLEAN",
    "HOW TO ORDER PRODUCTS & BUNDLES",
  ];
}