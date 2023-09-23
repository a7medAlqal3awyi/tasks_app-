import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_app/presentation/themes.dart';
import 'package:task_app/presentation/widgets/button.dart';

import '../widgets/input_feild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('h:mm a').format(DateTime.now()).toString();
  String _endTime = "9:60 PM";
  int _selectedReminder = 5;
  List<int> remindersList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        color: darkGreyColor,
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
                controller: _titleController,
                title: 'Title',
                hint: 'Enter Title',
              ),
              MyInputFiled(
                controller: _noteController,
                title: 'Note',
                hint: 'Enter Note',
              ),
              MyInputFiled(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputFiled(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: MyInputFiled(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputFiled(
                title: 'Remind',
                hint: "$_selectedReminder minutes early",
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    height: 0,
                  ),
                  iconSize: 32.w,
                  elevation: 4,
                  style: subTitleStyle,
                  items:
                      remindersList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    setState(() {
                      _selectedReminder = int.parse(value.toString());
                    });
                  },
                ),
              ),
              MyInputFiled(
                title: 'Repeat',
                hint: "$_selectedRepeat ",
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    height: 0,
                  ),
                  iconSize: 32.w,
                  elevation: 4,
                  style: subTitleStyle,
                  items:
                      repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    setState(() {
                      _selectedRepeat = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _colorPallete(),
                  MyButton(label: 'Create task', onTap: () =>_vailidateDate(),)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _vailidateDate() {
    if (_titleController.text.isEmpty & _noteController.text.isEmpty) {
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        backgroundColor: Colors.white,
        'Required',
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        colorText: pinkColor,
        icon: Icon(Icons.warning_amber_rounded,color: Colors.red,)
      );
    }
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        SizedBox(
          height: 5.h,
        ),
        Wrap(
          children: List<Widget>.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryColor
                      : index == 1
                          ? pinkColor
                          : yellowColor,
                  child: _selectedColor == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime.format(context);
    if (formattedTime == null) {
      debugPrint("No time selected.");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2150),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something is wrong ");
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
}
