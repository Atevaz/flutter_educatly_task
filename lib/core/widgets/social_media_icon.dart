import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_svg_image_provider.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.backgroundColor});

  final String icon;

  final Color backgroundColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: IconButton(
        onPressed: onPressed,
        icon: CustomSVGImageProvider(imagePath: icon,needColor: true,),
      ),
    );
  }
}
