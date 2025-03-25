import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';
import 'package:flutter_educatly_task/features/home/presentation/widgets/chat_user_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllUsersCubit, AllUsersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetAllUsersLoadingState
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => ChatUserItem(
                      userModel: AllUsersCubit.get(context).allUsersList[index],
                    ),
                separatorBuilder: (context, index) => Column(
                      children: [
                        Divider(color: AppColor.paragraphColor,thickness: .5,),
                      ],
                    ),
                itemCount: AllUsersCubit.get(context).allUsersList.length);
      },
    );
  }
}
