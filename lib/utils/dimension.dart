import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  //84.4=844(dimenssion height iphone12)/10
  //dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  //dynamic with padding and margin
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.27;
  static double width30 = screenHeight / 28.13;
  static double pageViewTextContainer = screenHeight / 7.03;
//font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
  //raduis
  static double raduis20 = screenHeight / 42.2;
  static double raduis15 = screenHeight / 56.27;
  static double raduis30 = screenHeight / 28.13;
  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextConstSize = screenWidth / 3.9;

  //popular client
  static double popularClientImgSize = screenHeight / 2.41;

  //bottom height
  static double botomheightBar = screenHeight / 7.03;
}
