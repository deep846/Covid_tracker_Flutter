import 'package:flutter/material.dart';

import '../constant.dart';

class Counter extends StatelessWidget {
  final int num;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.num,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$num",
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        ),
        Text(
          "$title",
          style: kSubTextStyle,
        )
      ],
    );
  }
}
