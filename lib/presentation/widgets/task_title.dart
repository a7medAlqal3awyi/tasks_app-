import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/models/task_model.dart';
import 'package:task_app/presentation/themes.dart';

class TaskTitle extends StatelessWidget {
  final TaskModel task;

  const TaskTitle(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 12.h),
        child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: _getBFClr(task?.color??0
                ),),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task?.title ?? "",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.grey[200])),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.white,
                            size: 20.w,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "${task.startTime} - ${task.endTime}",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[100],
                            )),
                          ),


                        ],
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Text(
                        task?.note ?? "",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 60.h,
                 width: .2.w,
                  color: Colors.grey[200]!.withOpacity(.7)
                ),
                RotatedBox(quarterTurns: 3,child:
                  Text(task.isCompleted ==1? "COMPLEATED"  :"TODO",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),),)
              ],
            )));
  }

  _getBFClr(int no) {
    switch (no){
      case 0:
        return blueColor;
      case 1:
        return pinkColor;
      case 2:
        return yellowColor;
        case 3:
        return deepOrange;
      default:
        return blueColor;
    }
  }
}
