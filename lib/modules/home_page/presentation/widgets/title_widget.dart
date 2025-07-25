
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLogisticWidget extends StatelessWidget {
  const AddLogisticWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 42.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Добавить груз",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
      ),
    );
  }
}
