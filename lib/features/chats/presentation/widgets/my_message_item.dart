import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/widgets/texts/medium_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/small_text.dart';
import 'package:flutter_educatly_task/features/chats/models/message_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/functions.dart';

class MyMessageItem extends StatelessWidget {
  const MyMessageItem({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
            color: AppColor.myMessageColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MediumText(
                  textAlign: TextAlign.start,
                  text: messageModel.text!,
                  color: AppColor.textColorDark,
                  maxLines: 1000,
                ),
                SmallText(text: formatDateTime(messageModel.dateTime!),color: AppColor.textColorDark,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
