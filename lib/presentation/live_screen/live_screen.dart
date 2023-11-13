import 'bloc/live_bloc.dart';
import 'models/live_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:george_u_s_application1/widgets/custom_floating_button.dart';
import 'package:george_u_s_application1/widgets/custom_text_form_field.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LiveBloc>(
      create: (context) => LiveBloc(LiveState(
        liveModelObj: LiveModel(),
      ))
        ..add(LiveInitialEvent()),
      child: LiveScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLive,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFourteen(context),
                Spacer(),
                _buildCommentSection(context),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Container(
      decoration: AppDecoration.gradientBlackToBlack,
      child: CustomAppBar(
        leadingWidth: 66.h,
        leading: AppbarLeadingCircleimage(
          imagePath: ImageConstant.imgEllipse9,
          margin: EdgeInsets.only(left: 16.h),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: Column(
            children: [
              AppbarSubtitle(
                text: "lbl_lucas_anna".tr,
              ),
              SizedBox(height: 5.v),
              AppbarSubtitleThree(
                text: "lbl_35_16".tr,
                margin: EdgeInsets.only(right: 76.h),
              ),
            ],
          ),
        ),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgClosePrimary,
            margin: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 13.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCommentSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.gradientGrayToBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 39.v,
                  bottom: 9.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder32,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse945x45,
                            height: 45.adaptSize,
                            width: 45.adaptSize,
                            radius: BorderRadius.circular(
                              22.h,
                            ),
                            margin: EdgeInsets.only(
                              top: 4.v,
                              bottom: 5.v,
                            ),
                          ),
                          Container(
                            width: 164.h,
                            margin: EdgeInsets.only(
                              left: 15.h,
                              top: 3.v,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_erlikhe_sweet".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray100,
                                  ),
                                  TextSpan(
                                    text: "msg_can_i_join_with".tr,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray100,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 6.v,
                      ),
                      decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder32,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse845x45,
                            height: 45.adaptSize,
                            width: 45.adaptSize,
                            radius: BorderRadius.circular(
                              22.h,
                            ),
                            margin: EdgeInsets.only(bottom: 1.v),
                          ),
                          Container(
                            width: 103.h,
                            margin: EdgeInsets.only(left: 18.h),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_dong_khuwan".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray100,
                                  ),
                                  TextSpan(
                                    text: "lbl_so_beautiful".tr,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray100,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgGroup9142,
                height: 180.v,
                width: 98.h,
              ),
            ],
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(right: 66.h),
            child: BlocSelector<LiveBloc, LiveState, TextEditingController?>(
              selector: (state) => state.commentController,
              builder: (context, commentController) {
                return CustomTextFormField(
                  controller: commentController,
                  hintText: "lbl_write_a_comment".tr,
                  hintStyle: CustomTextStyles.titleSmallPrimary,
                  textInputAction: TextInputAction.done,
                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                  fillColor: appTheme.gray600,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 50,
      width: 50,
      backgroundColor: appTheme.deepPurpleA200,
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup9143,
        height: 25.0.v,
        width: 25.0.h,
      ),
    );
  }
}
