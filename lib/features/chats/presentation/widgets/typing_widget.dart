import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/widgets/texts/medium_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/regular_text.dart';
import 'package:flutter_educatly_task/core/widgets/texts/small_text.dart';
import 'package:flutter_educatly_task/features/chats/manager/typing/typing_cubit.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';

class TypingWidget extends StatefulWidget {
  const TypingWidget({super.key});

  @override
  State<TypingWidget> createState() => _TypingWidgetState();
}

class _TypingWidgetState extends State<TypingWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TypingCubit.get(context).listenToTyping(receiverId: AllUsersCubit.get(context).selectedUserModel!.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TypingCubit, TypingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return TypingCubit.get(context).isUserTyping ? SmallText(text: TypingCubit.get(context).isUserTyping ? 'Typing ... ' : '') : Container();
      },
    );
  }
}
