import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_cubit/global/global_cubit.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double lineHeight;
  final bool isLineThrow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const SmallText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.maxLines = 10,
    this.fontFamily,
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
            color: color ?? GlobalCubit
                .get(context)
                .textColor,
            fontSize: fontSize ?? 10,
            overflow: overflow,
            decoration: isLineThrow == false
                ? TextDecoration.none
                : TextDecoration.lineThrough,
            height: lineHeight,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: fontFamily?? 'Roboto',
          ),
          maxLines: maxLines,
          textAlign: textAlign,
        );
      },
    );
  }
}
