import 'package:chatchap/widgets/app_column.dart';
import 'package:chatchap/widgets/small_taxt.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/dimension.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';

class ClientPageBody extends StatefulWidget {
  const ClientPageBody({super.key});

  @override
  State<ClientPageBody> createState() => _ClientPageBodyState();
}

class _ClientPageBodyState extends State<ClientPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        // pour avoir la valeur de changement du scroll
        _currPageValue = pageController.page!;
        // print('Current value is' + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //partie slider
        Container(
          // color: Colors.redAccent,
          height: Dimension.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimension.width30, bottom: Dimension.height10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing")),
            ],
          ),
        ),
        //list des client

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  bottom: Dimension.height10,
                ),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimension.listViewImgSize,
                      height: Dimension.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.raduis20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/ssss.png"))),
                    ),
                    //text partie
                    //Expanded pour que ca prenne la taille du parent
                    Expanded(
                      child: Container(
                        height: Dimension.listViewTextConstSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.raduis20),
                              bottomRight: Radius.circular(Dimension.raduis20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimension.width10,
                              right: Dimension.width10),
                          child: Column(
                            //aligner au debut
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //center sur le y
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Nutritious fruit meal in china"),
                              SizedBox(
                                height: Dimension.height10,
                              ),
                              SmallText(text: "With chinese charachteristics"),
                              SizedBox(
                                height: Dimension.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: Colors.orangeAccent),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.71Km",
                                      iconColor: Colors.blue),
                                  IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: Colors.red)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    // Utiliser Api de flutter Matrix4
    Matrix4 matrix = new Matrix4.identity();
    //c'est pour le slide current
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      //c'est pour le slide qui suit
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      //c'est ca qui envoie fait que la prochaine image est petite et vient de maniere sloly
      transform: matrix,
      child: Stack(
        children: [
          //  a  cause de stack ca prend le height mentionne dans le cas contraire, ca prend le heigt de son parent et au cas ou on met en commentaire son height
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimension.width10, right: Dimension.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.raduis30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage('images/ssss.png')),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.raduis20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                      //0 on veut pas ombre sur x, 5 on veut un decalage de l(ombre vers le bas)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height15, left: 15, right: 15),
                child: AppColumn(
                  text: "Chinese Side",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
