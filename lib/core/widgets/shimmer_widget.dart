import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_cubit/global/global_cubit.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({
    required this.height,
    required this.width,
    required this.radius,
    this.isChild = false,
    this.child,
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final Widget? child;
  final bool isChild;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation opcityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    opcityAnimation = Tween<double>(
        begin: widget.isChild ? 0.5 : 0.3, end: widget.isChild ? 0.8 : 0.6)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat(reverse: true);
    // Start the animation when the widget is first built
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Opacity(
          opacity: opcityAnimation.value,
          child: Container(
            padding: widget.padding,
            margin: widget.margin,
            width: widget.width.w,
            height: widget.height.h,
            decoration: BoxDecoration(
              color: GlobalCubit
                  .get(context)
                  .inputColor,
              borderRadius: BorderRadius.circular(widget.radius.r),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
