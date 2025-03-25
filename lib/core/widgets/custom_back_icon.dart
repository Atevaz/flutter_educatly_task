import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router/navigate_services.dart';
import '../colors/app_colors.dart';
import '../global_cubit/global/global_cubit.dart';
import 'custom_svg_image_provider.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.paragraphColor,
              ),
              shape: BoxShape.circle),
          child: IconButton(
            splashRadius: 15.r,
            onPressed: onPressed ??
                () {
                  NavigatorService.pop();
                },
            icon: BackButton(),
            iconSize: 20,
          ),
        );
      },
    );
  }
}
