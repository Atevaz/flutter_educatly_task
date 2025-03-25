import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors/app_colors.dart';
import '../../global_cubit/global/global_cubit.dart';

class ParagraphText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double lineHeight;
  final bool isLineThrow;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final String? fontFamily;

  const ParagraphText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines = 10,
    this.fontFamily,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.center,
    this.lineHeight = 1.5,
    this.isLineThrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Text(
          text,
          style: TextStyle(
              color: color ?? AppColor.paragraphColor,
              fontSize:  fontSize ?? 14,
              overflow: overflow,
              decoration: isLineThrow == false
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
              height: lineHeight,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: fontFamily?? 'Roboto'),
          maxLines: maxLines,
          textAlign: textAlign,
        );
      },
    );
  }
}
