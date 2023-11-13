import '../page_view_screen/widgets/pageview_item_widget.dart';
import 'bloc/page_view_bloc.dart';
import 'models/page_view_model.dart';
import 'models/pageview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:george_u_s_application1/widgets/custom_elevated_button.dart';
import 'package:george_u_s_application1/widgets/custom_floating_button.dart';
import 'package:george_u_s_application1/widgets/custom_text_form_field.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PageViewBloc>(
        create: (context) =>
            PageViewBloc(PageViewState(pageViewModelObj: PageViewModel()))
              ..add(PageViewInitialEvent()),
        child: PageViewScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(15.h),
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          theme.colorScheme.onPrimaryContainer,
                          appTheme.blueGray900
                        ]),
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgPageView),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Spacer(),
                      SizedBox(height: 39.v),
                      _buildStreamDetails(context)
                    ]))),
            floatingActionButton: _buildFloatingActionButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowBack,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowBack(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgReply,
              margin: EdgeInsets.only(left: 16.h, top: 13.v, right: 13.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgGroup8916,
              margin: EdgeInsets.only(left: 24.h, top: 13.v, right: 29.h))
        ]);
  }

  /// Section Widget
  Widget _buildPostDescription(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomElevatedButton(
          height: 28.v,
          width: 71.h,
          text: "lbl_4_6".tr,
          buttonStyle: CustomButtonStyles.fillDeepPurpleATL14,
          buttonTextStyle: CustomTextStyles.titleSmallPrimary),
      SizedBox(height: 22.v),
      Container(
          width: 300.h,
          margin: EdgeInsets.only(right: 81.h),
          child: Text("msg_haliford_luxury_hotel".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displayMedium)),
      SizedBox(height: 23.v),
      SizedBox(
          width: 381.h,
          child: Text("msg_halford_hotel_is".tr,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildStreamDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildPostDescription(context),
          SizedBox(height: 98.v),
          SizedBox(
              height: 40.v,
              child: BlocSelector<PageViewBloc, PageViewState, PageViewModel?>(
                  selector: (state) => state.pageViewModelObj,
                  builder: (context, pageViewModelObj) {
                    return ListView.separated(
                        padding: EdgeInsets.only(right: 236.h),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 13.h);
                        },
                        itemCount:
                            pageViewModelObj?.pageviewItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          PageviewItemModel model =
                              pageViewModelObj?.pageviewItemList[index] ??
                                  PageviewItemModel();
                          return PageviewItemWidget(model);
                        });
                  })),
          SizedBox(height: 40.v),
          Padding(
              padding: EdgeInsets.only(right: 66.h),
              child: BlocSelector<PageViewBloc, PageViewState,
                      TextEditingController?>(
                  selector: (state) => state.commentController,
                  builder: (context, commentController) {
                    return CustomTextFormField(
                        controller: commentController,
                        hintText: "lbl_write_a_comment".tr,
                        hintStyle: CustomTextStyles.titleSmallPrimary,
                        textInputAction: TextInputAction.done,
                        borderDecoration: TextFormFieldStyleHelper.fillGray,
                        fillColor: appTheme.gray600);
                  }))
        ]));
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
            width: 25.0.h));
  }

  /// Navigates to the previous screen.
  onTapArrowBack(BuildContext context) {
    NavigatorService.goBack();
  }
}
