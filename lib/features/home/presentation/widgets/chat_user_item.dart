import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/app_router/navigate_services.dart';
import 'package:flutter_educatly_task/core/app_router/screen_routes.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/widgets/texts/big_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/headline_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/medium_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/regular_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/small_text.dart';
import 'package:flutter_educatly_task/features/auth/data/models/response/user_model.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AllUsersCubit.get(context).changeSelectedUser(user: userModel) ;
        NavigatorService.pushNamed(AppRouterNames.chatRoute);
      },
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          spacing: 10.w,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.blueColor,
              child: BigText(
                text: userModel.name![0],
                color: AppColor.backgroundColorLight,
              ),
            ),
            Expanded(child: HeadLineText(text: userModel.name!,textAlign: TextAlign.start,)),
            RegularText(text: userModel.onlineStatus == true? 'online' : 'offline' , color: userModel.onlineStatus == true ? Colors.green : AppColor.paragraphColor ,)
          ],
        ),
      ),
    );
  }
}
