import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shart/core/resources/color.dart';
import 'package:shart/core/resources/font_manager.dart';
import 'package:shart/core/routing/navigation_services.dart';
import 'package:shart/features/user/auth/logic/auth_cubit.dart';
import 'package:shart/widgets/custom_button.dart';
import '../../../../../core/resources/assets_menager.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../widgets/custom_text_field.dart';


class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('UserLoginScreen building ===================');
    AuthCubit cubit =AuthCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 54.h, bottom: 24.h),
                child: Image.asset(
                  ImagesManager.introduction1,
                  width: 220.sp,
                  height: 220.sp,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: FontConstants.lateefFont,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  border: Border.all(color: greyColor),
                ),
                padding: EdgeInsets.all(16.sp),
                child: BlocConsumer<AuthCubit,AuthState>(
                  builder: (BuildContext context,AuthState state){
                    return  Column(
                      children: <Widget>[
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hintText: 'رقم الهاتف',
                          controller: cubit.phoneController,
                          textInputType: TextInputType.phone,

                          validationFunc: (String? val) {
                            if (val!.length!=11) {
                              return 'رقم الهاتف لا يساوي 11 رقم يجب التاكد من رقم الهاتف';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                          child: CustomTextField(
                            validationFunc: (String? val) {
                              if (val!.isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              }
                              return null;
                            },
                            isPassword: cubit.visibility,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'كلمة المرور',
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            controller: cubit.passwordController,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeVisibilityIcon();
                              },
                              icon: Icon(cubit.visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            onFieldSubmitted: (String value){
                              AuthCubit.get(context).userLogin(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              onTap: () =>
                                  NavigationManager.push(Routes.forgotPassword),
                              child: const Text('نسيت كلمة المرور ؟')),
                        ),
                        cubit.isLoading==false?
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h, top: 64.h),
                          child: CustomElevatedButton(
                              onTap: () {
                                AuthCubit.get(context).userLogin(context);
                              },
                              buttonText: 'تسجيل الدخول'),
                        ):Padding(
                          padding:  EdgeInsets.only(top:64.h,bottom: 20.h),
                          child: Center(child: CircularProgressIndicator(),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 125.h),
                          child: InkWell(
                            onTap: () {
                              NavigationManager.pushReplacement(Routes.register);
                            },
                            child: const Text(
                              'إنشاء حساب؟',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  listener: (BuildContext context,AuthState state){},
                )

              )
            ],
          ),
        ),
      ),
    );
  }
}
