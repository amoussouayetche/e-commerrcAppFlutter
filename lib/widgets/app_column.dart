import 'package:chatchap/utils/dimension.dart';
import 'package:chatchap/widgets/big_text.dart';
import 'package:chatchap/widgets/icon_and_text_widget.dart';
import 'package:chatchap/widgets/small_taxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return Icon(
                    Icons.star,
                    color: Colors.blue,
                    size: 15,
                  );
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimension.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
