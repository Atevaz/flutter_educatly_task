import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/features/auth/data/models/request/create_user_request_model.dart';
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
import '../../../../core/widgets/custom_svg_image_provider.dart';
import '../../../../core/widgets/dark_night_widget.dart';
import '../../../../core/widgets/texts/big_text.dart';
import '../../manager/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    userNameFocusNode.addListener(_onFocusChange);
    passwordFocusNode.addListener(_onFocusChange);
    emailFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {}); // Triggers a rebuild when focus changes
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(_onFocusChange);
    userNameFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DarkNightWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const BigText(
                    text: 'Let\'s get \nstarted',
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
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return MyFormField(
                              focusNode: userNameFocusNode,
                              controller: userNameController,
                              validateText: (value) {
                                if (value!.isEmpty) {
                                  return 'Name is required';
                                } else {
                                  return null;
                                }
                              },
                              onSubmit: (v) {
                                userNameFocusNode.unfocus();
                                FocusScope.of(context).requestFocus(
                                    emailFocusNode);
                              },
                              inputType: TextInputType.text,
                              hintText: 'Name'.tr(),
                              prefix: CustomSVGImageProvider(
                                imagePath: AssetsManager.userIcon,
                              ),
                              // autofocus: true,
                            );
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return MyFormField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              validateText: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required'.tr();
                                } else {
                                  return null;
                                }
                              },
                              onSubmit: (v) {
                                emailFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
                              inputType: TextInputType.visiblePassword,
                              hintText: 'Email'.tr(),
                              maxLine: 1,
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
                        BlocConsumer<RegisterCubit, RegisterState>(
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
                              onSubmit: (v) {
                                passwordFocusNode.unfocus();
                              },
                              inputType: TextInputType.visiblePassword,
                              hintText: 'Password'.tr(),
                              isPassword: !showPassword,
                              maxLine: 1,
                              prefix: CustomSVGImageProvider(
                                imagePath: AssetsManager.passwordIcon,
                              ),
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
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return MyButton(
                              onTap: () {
                                RegisterCubit.get(context).register(
                                    createUserRequestModel: CreateUserRequestModel(
                                        name: userNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        onlineStatus: true));
                              },
                              title: 'Sign Up',
                              isLoading: state is RegisterLoadingState ? true :false,
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
                              SmallText(
                                text: 'Already have an account?',
                                color: AppColor.paragraphColor,
                              ),
                              TextButton(
                                onPressed: () {
                                  NavigatorService.pushReplacementNamed(
                                      AppRouterNames.loginRoute);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SmallText(
                                      text: 'Login',
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
