import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/widgets/texts/headline_text.dart';
import 'package:flutter_educatly_task/features/chats/manager/get_messages/get_messages_cubit.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/texts/regular_text.dart';
import '../views/messages_view.dart';
import '../views/send_message_view.dart';
import '../widgets/typing_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetMessagesCubit.get(context).getMessages(
        receiverId: AllUsersCubit.get(context).selectedUserModel!.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadLineText(
                text: AllUsersCubit.get(context).selectedUserModel!.name ?? ''),
            TypingWidget(),
          ],
        ),
        centerTitle: false,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Divider(
            color: AppColor.paragraphColor,
            thickness: .3,
          ),
          MessagesView(),
          SizedBox(
            height: 10.h,
          ),
          SendMessageView()
        ],
      ),
    );
  }
}
