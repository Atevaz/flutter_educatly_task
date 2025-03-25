import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:flutter_educatly_task/core/global_cubit/global/global_cubit.dart';
import 'package:flutter_educatly_task/core/widgets/my_form_field.dart';
import 'package:flutter_educatly_task/features/chats/manager/send_message/send_message_cubit.dart';
import 'package:flutter_educatly_task/features/chats/models/message_model.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/get_messages/get_messages_cubit.dart';
import '../../manager/typing/typing_cubit.dart';

class SendMessageView extends StatefulWidget {
  const SendMessageView({super.key});

  @override
  State<SendMessageView> createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  TextEditingController messageController = TextEditingController();
  bool _isTyping = false;
  Timer? _debounce;

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel(); // إلغاء أي عملية سابقة

    // تأجيل الفانكشن لكي تتنفذ فقط بعد فترة قصيرة من التوقف عن الكتابة
    _debounce = Timer(Duration(seconds: 1), () {
      if (text.isNotEmpty && messageController.text.isNotEmpty) {
        _startTyping();  // وظيفة الكتابة
      } else {
        _stopTyping();  // وظيفة التوقف عن الكتابة
      }
    });
  }

  // الفانكشن عندما يبدأ المستخدم الكتابة
  void _startTyping() {
    if (!_isTyping) {
      setState(() {
        _isTyping = true;
      });
      print("User is typing...");
      TypingCubit.get(context).userTyping(
          receiverId: AllUsersCubit.get(context)
              .selectedUserModel!
              .userId!,
          isUserTyping: true);
    }
  }

  // الفانكشن عندما يتوقف المستخدم عن الكتابة
  void _stopTyping() {
    if (_isTyping) {
      setState(() {
        _isTyping = false;
      });
      print("User stopped typing");
      TypingCubit.get(context).userTyping(
          receiverId: AllUsersCubit.get(context)
              .selectedUserModel!
              .userId!,
          isUserTyping: false);
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    messageController.dispose();
    if(_debounce!= null ) _debounce!.cancel() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalCubit.get(context).isDark
          ? AppColor.sendMessageViewColorDark
          : AppColor.sendMessageViewColorLight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 30.h),
        child: Row(
          spacing: 10.w,
          children: [
            BlocConsumer<SendMessageCubit, SendMessageState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 30.h,
                      maxHeight: 150.h,
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: GetMessagesCubit.get(context).scrollController,
                      child: MyFormField(
                          borderRadius: 12.r,
                          controller: messageController,
                          validateText: (c) {
                            return null;
                          },
                          onChanged: _onTextChanged,
                          inputType: TextInputType.text,
                          hintText: 'Type a message'),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  SendMessageCubit.get(context).sendMessage(
                      messageModel: MessageModel(
                    text: messageController.text,
                    senderId: userId,
                    receiverId:
                        AllUsersCubit.get(context).selectedUserModel!.userId,
                  ));
                  messageController.clear();
                  _stopTyping();
                }
              },
              icon: Icon(
                Icons.send_rounded,
                color: AppColor.myMessageColor,
              ),
              splashRadius: 25.r,
            )
          ],
        ),
      ),
    );
  }
}
