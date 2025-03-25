import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/features/chats/manager/get_messages/get_messages_cubit.dart';
import 'package:flutter_educatly_task/features/chats/models/message_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/constants.dart';
import '../widgets/message_item.dart';
import '../widgets/my_message_item.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMessagesCubit, GetMessagesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(

            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              reverse: true,
              controller: GetMessagesCubit.get(context).scrollController,
          itemBuilder: (context, index) {
            MessageModel message = GetMessagesCubit.get(context).messagesList[index] ;
            if(message.senderId == userId) {
              return MyMessageItem(
                messageModel: GetMessagesCubit.get(context).messagesList[index],
              );
            }
            return MessageItem(
              messageModel: GetMessagesCubit.get(context).messagesList[index],
            );
          },
              separatorBuilder: (context,index)=> SizedBox(height: 10.h,),
          itemCount: GetMessagesCubit.get(context).messagesList.length,
        ));
      },
    );
  }
}
