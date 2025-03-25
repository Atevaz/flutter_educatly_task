import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../global_cubit/global/global_cubit.dart';
import 'custom_svg_image_provider.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onPressed});

  final String icon;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.paragraphColor,
              ),
              shape: BoxShape.circle),
          child: IconButton(
              splashRadius: 20,
              onPressed: onPressed,
              icon: CustomSVGImageProvider(imagePath: icon,needColor: true,)),
        );
      },
    );
  }
}
