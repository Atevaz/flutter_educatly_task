import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';
import '../global_cubit/global/global_cubit.dart';

class MyFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLine;
  final int? maxLength;
  final void Function()? onTap;
  final TextEditingController controller;
  final String? Function(String?)? validateText;
  final bool isPassword;
  final double borderRadius;
  final bool readOnly;
  final bool? autofocus;
  final TextInputType inputType;
  final String hintText;
  final String? labelText;
  final String? errorText;
  final TextAlign textAlign;
  final Function()? suffixPressed;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onSubmit;
  final Color? borderColor;
  final Color? fillColor;
  final FocusNode? focusNode;

  final List<TextInputFormatter>? inputFormatters;

  const MyFormField({
    Key? key,
    this.borderRadius = 30,
    required this.controller,
    required this.validateText,
    this.maxLine,
    this.maxLength,
    this.onTap,
    this.contentPadding,
    this.suffixPressed,
    this.errorText,
    this.isPassword = false,
    required this.inputType,
    required this.hintText,
    this.autofocus,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmit,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.labelText,
    this.borderColor,
    this.fillColor,
    this.inputFormatters,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            boxShadow: focusNode == null
                ? null
                : focusNode!.hasFocus
                    ? [
                        BoxShadow(
                          color: Color(0xff1F95D8).withOpacity(.6), // Shadow color
                          blurRadius: 6.8, // Shadow blur effect
                          spreadRadius: 2, // Shadow spread effect
                        ),
                      ]
                    : [],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextFormField(
            focusNode: focusNode,
            autofocus: autofocus ?? false,
            onTapOutside: onTapOutside ?? (s) {},
            onChanged: onChanged ?? (v) {},
            onFieldSubmitted: onSubmit ?? (v) {},
            readOnly: readOnly,
            controller: controller,
            validator: validateText,
            inputFormatters: inputFormatters != null
                ? inputFormatters
                : maxLength == null
                    ? null
                    : [
                        LengthLimitingTextInputFormatter(maxLength),
                      ],
            maxLines: maxLine,
            obscureText: isPassword,
            keyboardType: inputType,
            textAlign: textAlign,
            decoration: InputDecoration(
              errorText: errorText,
              errorMaxLines: 5,
              suffixIcon: suffix,
              prefixIcon: prefix,
              contentPadding: contentPadding ??
                  EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
              hintText: hintText,
              labelText: labelText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: GlobalCubit.get(context).textColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius.r),
                borderSide: BorderSide(
                    color: borderColor ?? GlobalCubit.get(context).inputColor, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius.r),
                borderSide: BorderSide(
                    color: borderColor ?? GlobalCubit.get(context).inputColor, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius.r),
                borderSide: BorderSide(
                    color: borderColor ?? GlobalCubit.get(context).inputColor, width: 0),
              ),
              fillColor: GlobalCubit.get(context).inputColor,
              filled: true,
            ),
            style: TextStyle(
                color: GlobalCubit.get(context).textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            cursorColor: AppColor.blueColor,
            onTap: onTap ?? () {},
          ),
        );
      },
    );
  }
}
