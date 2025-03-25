import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global_cubit/global/global_cubit.dart';

class CustomSVGImageProvider extends StatelessWidget {
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final String imagePath;
  final void Function()? onTap;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Color? iamgeColor;
  final bool? needColor;

  const CustomSVGImageProvider({
    super.key,
    this.boxFit,
    this.height,
    this.width,
    required this.imagePath,
    this.onTap,
    this.margin,
    this.alignment,
    this.iamgeColor,
    this.needColor,
  });

  @override
  Widget build(BuildContext context) => BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: height ?? 20,
              width: width ?? 20,
              margin: margin,
              alignment: alignment ?? Alignment.center,
              child: imagePath.startsWith('asset')
                  ? SvgPicture.asset(
                      imagePath,
                      color: needColor == null ? GlobalCubit.get(context).textColor : iamgeColor,
                      fit: boxFit ?? BoxFit.fill,
                      height: height ?? 20,
                      width: width ?? 20,
                      placeholderBuilder: (context) => Icon(
                        Icons.image,
                        color: GlobalCubit.get(context).backgroundColor,
                        size: width ?? 20,
                      ),
                    )
                  : imagePath.startsWith('http')
                      ? SvgPicture.network(
                          imagePath,
                          fit: boxFit ?? BoxFit.fill,
                          height: height,
                          width: width,
                          placeholderBuilder: (context) => Icon(Icons.image,
                              color: GlobalCubit.get(context).backgroundColor,
                              size: 20),
                        )
                      : SvgPicture.file(
                          File(imagePath),
                          fit: boxFit ?? BoxFit.fill,
                          height: height,
                          width: width,
                          placeholderBuilder: (context) => Icon(Icons.image,
                              color: GlobalCubit.get(context).backgroundColor,
                              size: 20),
                        ),
            ),
          );
        },
      );
}
