import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/app_colors.dart';
import '../global_cubit/global/global_cubit.dart';
import 'texts/headline_text.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.onTap,
    required this.title,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.isBorder = false,
    this.isLoading = false,
    this.color,
    this.needShadow,
    this.textColor,
    super.key,
  });

  final void Function()? onTap;
  final String title;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool isBorder;
  final bool isLoading;
  final Color? color;
  final bool? needShadow;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? double.infinity,
      height: height ?? 46.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color ?? AppColor.blueColor,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          if(needShadow == true) BoxShadow(
            color: AppColor.backgroundColorLight.withOpacity(.25),
            offset: Offset(3, 4),
            blurRadius: 9.4,
            spreadRadius: 0
          ),
        ]
      ),
      child: MaterialButton(
        onPressed: isLoading == true ? (){} : onTap,
        child: Center(
          child: isLoading == true ? CircularProgressIndicator(color: AppColor.backgroundColorLight,) :BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return HeadLineText(
                text: title,
                textAlign: TextAlign.center,
                color: textColor ?? AppColor.textButtonColor,
                fontSize: 14,
              );
            },
          ),
        ),
      ),
    );
  }
}
