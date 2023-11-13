import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/core/utils/validation_functions.dart';
import 'package:george_u_s_application1/widgets/custom_elevated_button.dart';
import 'package:george_u_s_application1/widgets/custom_icon_button.dart';
import 'package:george_u_s_application1/widgets/custom_radio_button.dart';
import 'package:george_u_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
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
                      SizedBox(height: 37.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("msg_create_a_new_account".tr,
                              style: CustomTextStyles.headlineLargePrimary)),
                      SizedBox(height: 10.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("msg_it_s_fast_and_easy".tr,
                              style: CustomTextStyles.bodyLargePrimary)),
                      SizedBox(height: 21.v),
                      _buildFirstNameRow(context),
                      SizedBox(height: 16.v),
                      _buildEmail(context),
                      SizedBox(height: 16.v),
                      _buildPhone(context),
                      SizedBox(height: 16.v),
                      _buildDateOfBirth(context),
                      SizedBox(height: 26.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_gender".tr,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 8.v),
                      _buildGenderRadioGroup(context),
                      SizedBox(height: 42.v),
                      Container(
                          width: 367.h,
                          margin: EdgeInsets.only(left: 8.h, right: 5.h),
                          child: Text("msg_by_clicking_register".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 25.v),
                      _buildSignUpButton(context),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 8.h),
            child:
                BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                    selector: (state) => state.firstNameController,
                    builder: (context, firstNameController) {
                      return CustomTextFormField(
                          controller: firstNameController,
                          hintText: "lbl_first_name".tr,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          });
                    })));
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child:
                BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                    selector: (state) => state.lastNameController,
                    builder: (context, lastNameController) {
                      return CustomTextFormField(
                          controller: lastNameController,
                          hintText: "lbl_last_name".tr,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          });
                    })));
  }

  /// Section Widget
  Widget _buildFirstNameRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildFirstName(context), _buildLastName(context)]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_email_id".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPhone(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.phoneController,
        builder: (context, phoneController) {
          return CustomTextFormField(
              controller: phoneController,
              hintText: "lbl_phone_no".tr,
              textInputType: TextInputType.phone,
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.dateOfBirthController,
        builder: (context, dateOfBirthController) {
          return CustomTextFormField(
              controller: dateOfBirthController,
              hintText: "lbl_date_of_birth".tr,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCalendartoday,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 50.v),
              contentPadding:
                  EdgeInsets.only(left: 16.h, top: 15.v, bottom: 15.v));
        });
  }

  /// Section Widget
  Widget _buildGenderRadioGroup(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return state.signUpModelObj!.radioList.isNotEmpty
          ? Row(children: [
              CustomRadioButton(
                  text: "lbl_female".tr,
                  value: state.signUpModelObj?.radioList[0] ?? "",
                  groupValue: state.genderRadioGroup,
                  padding: EdgeInsets.fromLTRB(8.h, 14.v, 30.h, 14.v),
                  onChange: (value) {
                    context
                        .read<SignUpBloc>()
                        .add(ChangeRadioButtonEvent(value: value));
                  }),
              Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: CustomRadioButton(
                      text: "lbl_male".tr,
                      value: state.signUpModelObj?.radioList[1] ?? "",
                      groupValue: state.genderRadioGroup,
                      padding: EdgeInsets.fromLTRB(8.h, 14.v, 30.h, 14.v),
                      onChange: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(ChangeRadioButtonEvent(value: value));
                      }))
            ])
          : Container();
    });
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr, buttonStyle: CustomButtonStyles.fillPrimary);
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
