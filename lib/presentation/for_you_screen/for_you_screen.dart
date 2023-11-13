import 'bloc/for_you_bloc.dart';
import 'models/for_you_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ForYouBloc>(
      create: (context) => ForYouBloc(ForYouState(
        forYouModelObj: ForYouModel(),
      ))
        ..add(ForYouInitialEvent()),
      child: ForYouScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ForYouBloc, ForYouState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgForYou,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.v),
                    _buildSixteen(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSixteen(BuildContext context) {
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
}
