import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/presentation/themes.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label, required this.onTap});
final String label;
final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),

    );
  }
}
