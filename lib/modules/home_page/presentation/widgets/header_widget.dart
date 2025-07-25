
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Александр Прокофьев",
              style: TextStyle(fontSize: 16.sp, color: Color(0xff000032)),
            ),
            Text(
              "Супер админ",
              style: TextStyle(fontSize: 16.sp, color: Color(0xff000032)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text(
              "AU",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
