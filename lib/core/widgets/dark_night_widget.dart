import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/app_repo_assets.dart';
import '../global_cubit/global/global_cubit.dart';
import 'custom_icon.dart';

class DarkNightWidget extends StatelessWidget {
  const DarkNightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState> (
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomIcon(
          onPressed: (){
            GlobalCubit.get(context).changeAppMode();
            // print(FieldValue.serverTimestamp().toString())
          },
          icon: GlobalCubit.get(context).isDark ?  AssetsManager.moonIcon : AssetsManager.sunIcon,
        );
      },
    );
  }
}
