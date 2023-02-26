import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/dimension.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_taxt.dart';
import 'client_page_body.dart';

class MainClientPage extends StatefulWidget {
  const MainClientPage({super.key});

  @override
  State<MainClientPage> createState() => _MainClientPageState();
}

class _MainClientPageState extends State<MainClientPage> {
  @override
  Widget build(BuildContext context) {
    // print('curent height is' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //montrer l'entete
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimension.height45, bottom: Dimension.height15),
              padding: EdgeInsets.only(
                  left: Dimension.width20, right: Dimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      BigText(text: "Togo", color: Colors.blue),
                      Row(
                        children: [
                          SmallText(
                            text: "Lome",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimension.height45,
                      height: Dimension.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimension.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.raduis15),
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //montrer le corp
          Expanded(
              child: SingleChildScrollView(
            child: ClientPageBody(),
          ))
        ],
      ),
    );
  }
}
