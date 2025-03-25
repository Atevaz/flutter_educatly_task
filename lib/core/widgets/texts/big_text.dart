import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global_cubit/global/global_cubit.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  const BigText({Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 10,
    this.fontFamily,
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = true,
    this.textAlign = TextAlign.center,
    this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Text(
          isUpper! ? text.toUpperCase() : text,
          style: TextStyle(
            letterSpacing: 0,
            color: color ?? GlobalCubit
                .get(context)
                .textColor,
            fontWeight: FontWeight.w500,
            fontSize:  fontSize ?? 20,
            height: height ?? 1,
            overflow: overflow,
            fontFamily: fontFamily ?? 'Roboto',
          ),
          maxLines: maxLines,
          textAlign: textAlign,
        );
      },
    );
  }
}
