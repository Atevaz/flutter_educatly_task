import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/colors/app_colors.dart';
import 'package:flutter_educatly_task/core/widgets/dark_night_widget.dart';
import 'package:flutter_educatly_task/core/widgets/texts/headline_text.dart';
import 'package:flutter_educatly_task/features/home/presentation/views/all_users_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/functions.dart';
import '../../manager/update_user_status/update_user_status_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {

      UpdateUserStatusCubit.get(context).updateUserStatus(
        status: true,
      );
    } else {
      UpdateUserStatusCubit.get(context).updateUserStatus(
        status: false,
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadLineText(text: 'Users'),
        centerTitle: true,
        actions: [
          DarkNightWidget(),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: AllUsersView(),
      floatingActionButton: FloatingActionButton(
        onPressed:  ()=> logoutFun(context),
        backgroundColor: AppColor.redColor,
        child: Icon(
          Icons.logout_rounded,
          color: AppColor.backgroundColorLight,
        ),
      ),
    );
  }
}
