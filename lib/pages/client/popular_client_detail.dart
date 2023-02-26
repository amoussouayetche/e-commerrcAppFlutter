import 'package:chatchap/utils/dimension.dart';
import 'package:chatchap/widgets/app_column.dart';
import 'package:chatchap/widgets/app_icon.dart';
import 'package:chatchap/widgets/big_text.dart';
import 'package:chatchap/widgets/expandable_text_widget.dart';
import 'package:chatchap/widgets/icon_and_text_widget.dart';
import 'package:chatchap/widgets/small_taxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PopularClientDetail extends StatelessWidget {
  const PopularClientDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //L'image positionnée
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularClientImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("images/ssss.png"))),
            ),
          ),
          //Pour positionner les iconnes sur l'image
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          //introduction client
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimension.popularClientImgSize,
            // top: Dimension.popularClientImgSize-20 pour faire apparaitre le border raduis,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.width20),
                    topLeft: Radius.circular(Dimension.width20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Chinese Side",
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  BigText(text: "Description"),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Expandeble text n a crée le widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum."),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.botomheightBar,
        padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 146, 142, 141),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(Dimension.raduis20 * 2),
          //   topRight: Radius.circular(Dimension.width20 * 2),
          // )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.width20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(
                    text: "0",
                    size: Dimension.font16,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.width20),
                color: Colors.blue,
              ),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
                size: Dimension.font16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
