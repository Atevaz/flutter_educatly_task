import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/global_cubit/global/global_cubit.dart';
import 'package:flutter_educatly_task/core/widgets/texts/medium_text.dart';
import 'package:flutter_educatly_task/features/chats/models/message_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/functions.dart';
import '../../../../core/widgets/texts/small_text.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 30.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            color: GlobalCubit.get(context).isDark ? AppColor.messageColorDark  : AppColor.messageColorLight,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  textAlign: TextAlign.start,
                  text: messageModel.text!,
                  color: GlobalCubit.get(context).isDark ? AppColor.textColorDark:AppColor.textColorLight,
                  maxLines: 1000,
                ),
                SmallText(text: formatDateTime(messageModel.dateTime!),color: GlobalCubit.get(context).isDark ? AppColor.textColorDark: AppColor.textColorLight,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
