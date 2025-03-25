import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/widgets/texts/headline_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/app_colors.dart';

class ErrorOccurredWidget extends StatelessWidget {
  const ErrorOccurredWidget({
    required this.onTap,
    super.key,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(AppRepoAssets.errorIcon),
          SizedBox(
            height: 16.h,
          ),
          HeadLineText(text: 'حدث خطأ'),
          SizedBox(
            height: 12.h,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 139.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: AppColor.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Center(
                child: Text(
                  "إعادة المحاولة",
                  style: TextStyle(
                    color: AppColor.textColorLight,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
