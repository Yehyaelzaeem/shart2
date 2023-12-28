import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shart/core/resources/color.dart';


class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white),
    );
  }
}

class CustomLoadingButtonWidget extends StatelessWidget {
  const CustomLoadingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ElevatedButton(
          onPressed: () {
            return;
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(54.h),
            elevation: 0,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r)),
          ),
          child: const CustomLoadingWidget(),
        ));
  }
}
