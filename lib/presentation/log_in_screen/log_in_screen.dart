import 'bloc/log_in_bloc.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/core/utils/validation_functions.dart';
import 'package:george_u_s_application1/widgets/custom_elevated_button.dart';
import 'package:george_u_s_application1/widgets/custom_icon_button.dart';
import 'package:george_u_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(LogInState(logInModelObj: LogInModel()))
          ..add(LogInInitialEvent()),
        child: LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.deepPurpleA200,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 3.v),
                    child: Column(children: [
                      CustomIconButton(
                          height: 44.adaptSize,
                          width: 44.adaptSize,
                          padding: EdgeInsets.all(10.h),
                          decoration: IconButtonStyleHelper.fillDeepPurpleA,
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapBtnArrowLeft(context);
                          },
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowLeft)),
                      SizedBox(height: 79.v),
                      _buildPageTitle(context),
                      SizedBox(height: 33.v),
                      BlocSelector<LogInBloc, LogInState,
                              TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailController) {
                            return CustomTextFormField(
                                controller: emailController,
                                hintText: "lbl_email_id".tr,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email"
                                        .tr;
                                  }
                                  return null;
                                });
                          }),
                      SizedBox(height: 24.v),
                      BlocBuilder<LogInBloc, LogInState>(
                          builder: (context, state) {
                        return CustomTextFormField(
                            controller: state.passwordController,
                            hintText: "lbl_password".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: InkWell(
                                onTap: () {
                                  context.read<LogInBloc>().add(
                                      ChangePasswordVisibilityEvent(
                                          value: !state.isShowPassword));
                                },
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 13.v, 16.h, 13.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant
                                            .imgAntdesigneyeinvisiblefilled,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize))),
                            suffixConstraints: BoxConstraints(maxHeight: 50.v),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                            obscureText: state.isShowPassword,
                            contentPadding: EdgeInsets.only(
                                left: 16.h, top: 15.v, bottom: 15.v));
                      }),
                      SizedBox(height: 27.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtForgotPassword(context);
                              },
                              child: Text("msg_forgot_password".tr,
                                  style: CustomTextStyles.bodyLargePrimary))),
                      SizedBox(height: 30.v),
                      CustomElevatedButton(
                          text: "lbl_log_in".tr,
                          buttonStyle: CustomButtonStyles.fillPrimary),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildPageTitle(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_welcome_to_social".tr,
          style: CustomTextStyles.headlineLargePrimary),
      SizedBox(height: 12.v),
      Text("msg_please_enter_your".tr, style: CustomTextStyles.bodyLargePrimary)
    ]);
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }
}
