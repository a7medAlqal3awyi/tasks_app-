import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_app/presentation/themes.dart';

import '../widgets/input_feild.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              MyInputFiled(
                title: 'Task',
                hint: 'learn flutter',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_appBar(BuildContext context) {
  return AppBar(
    backgroundColor: context.theme.colorScheme.background,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        size: 20.w,
      ),
    ),
    actions: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/images/ahmed.jpg'),
      ),
      SizedBox(
        width: 20.w,
      )
    ],
  );
}
