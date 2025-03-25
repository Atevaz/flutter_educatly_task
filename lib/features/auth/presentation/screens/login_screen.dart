import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_educatly_task/core/app_router/navigate_services.dart';
import 'package:flutter_educatly_task/core/app_router/screen_routes.dart';
import 'package:flutter_educatly_task/core/global_cubit/global/global_cubit.dart';
import 'package:flutter_educatly_task/core/widgets/my_button.dart';
import 'package:flutter_educatly_task/core/widgets/my_form_field.dart';
import 'package:flutter_educatly_task/core/widgets/custom_back_icon.dart';
import 'package:flutter_educatly_task/core/widgets/texts/small_text.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/constant/app_repo_assets.dart';
import '../../../../core/widgets/custom_icon.dart';
import '../../../../core/widgets/custom_svg_image_provider.dart';
import '../../../../core/widgets/dark_night_widget.dart';
import '../../../../core/widgets/texts/big_text.dart';
import '../../manager/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(_onFocusChange);
    passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {}); // Triggers a rebuild when focus changes
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      DarkNightWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const BigText(
                    text: 'Hey, \nWelcome \nBack',
                    textAlign: TextAlign.start,
                    fontSize: 40,
                    isUpper: false,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return MyFormField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              validateText: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is Required';
                                } else {
                                  return null;
                                }
                              },
                              onSubmit: (v) {
                                emailFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
                              inputType: TextInputType.text,
                              hintText: 'Email'.tr(),
                              prefix: CustomSVGImageProvider(
                                imagePath: AssetsManager.emailIcon,
                              ),
                              // autofocus: true,
                            );
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return MyFormField(
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              validateText: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                } else {
                                  return null;
                                }
                              },
                              inputType: TextInputType.visiblePassword,
                              hintText: 'Password'.tr(),
                              isPassword: !showPassword,
                              maxLine: 1,
                              prefix: CustomSVGImageProvider(
                                imagePath: AssetsManager.passwordIcon,
                              ),
                              onSubmit: (v) {
                                passwordFocusNode.hasFocus;
                              },
                              suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: SmallText(
                                      color: AppColor.paragraphColor,
                                      text: showPassword ? 'hide' : 'show')),
                              // autofocus: true,
                            );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return MyButton(
                              onTap: () {
                                LoginCubit.get(context).login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                              title: 'Login',
                              isLoading: state is LoginLoadingState ? true : false,
                              needShadow: false,

                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SmallText(
                                text: 'Dont have an account?',
                                color: AppColor.paragraphColor,
                              ),
                              TextButton(
                                onPressed: () {
                                  NavigatorService.pushReplacementNamed(
                                      AppRouterNames.registerRoute);
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SmallText(
                                      text: 'Sign up',
                                      color: AppColor.blueColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
