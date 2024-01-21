import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shart/core/localization/appLocale.dart';
import 'package:shart/widgets/custom_app_bar.dart';
import 'package:shart/widgets/custom_button.dart';
import 'package:shart/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool passwordVisibility = false;
  bool passwordConfirmVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80.h),
        child: CustomAppBar(title: getLang(context, 'update_password'),hasBackButton: true),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
        child: Column(
          children: <Widget>[
            CustomTextField(
              hintText: getLang(context, 'new_password'),
              controller: passwordController,
              textInputType: TextInputType.visiblePassword,
              isPassword: passwordVisibility,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                  icon: passwordVisibility
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  }),
            ),

            Padding(
              padding:   EdgeInsets.only(top: 20.h,bottom: 30.h),
              child: CustomTextField(
                hintText:getLang(context, 'sure_new_password'),
                controller: passwordConfirmController,
                textInputType: TextInputType.visiblePassword,
                isPassword: passwordConfirmVisibility,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: passwordConfirmVisibility
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordConfirmVisibility = !passwordConfirmVisibility;
                      });
                    }),
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomElevatedButton(onTap: (){}, buttonText: getLang(context, 'sure')),
            )
          ],
        ),
      ),
    );
  }
}
