import '../friends_screen/widgets/followlist_item_widget.dart';
import '../friends_screen/widgets/socialmedialist_item_widget.dart';
import 'bloc/friends_bloc.dart';
import 'models/followlist_item_model.dart';
import 'models/friends_model.dart';
import 'models/socialmedialist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:george_u_s_application1/widgets/custom_search_view.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FriendsBloc>(
        create: (context) =>
            FriendsBloc(FriendsState(friendsModelObj: FriendsModel()))
              ..add(FriendsInitialEvent()),
        child: FriendsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_friends".tr,
                              style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 13.v),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: BlocSelector<FriendsBloc, FriendsState,
                                      TextEditingController?>(
                                  selector: (state) => state.searchController,
                                  builder: (context, searchController) {
                                    return CustomSearchView(
                                        controller: searchController,
                                        hintText: "lbl_search".tr,
                                        alignment: Alignment.center);
                                  }))),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("msg_connect_to_your".tr,
                              style: CustomTextStyles
                                  .titleLargeDeeppurpleA200Bold)),
                      SizedBox(height: 28.v),
                      _buildSocialMediaList(context),
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_recommeded".tr,
                              style: CustomTextStyles
                                  .titleLargeDeeppurpleA200Bold)),
                      SizedBox(height: 16.v),
                      _buildFollowList(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowBackDeepPurpleA200,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowBack(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPersonAddAlt1,
              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
              onTap: () {
                onTapPersonAddAltOne(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildSocialMediaList(BuildContext context) {
    return SizedBox(
        height: 50.v,
        child: BlocSelector<FriendsBloc, FriendsState, FriendsModel?>(
            selector: (state) => state.friendsModelObj,
            builder: (context, friendsModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h, right: 106.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 30.h);
                  },
                  itemCount:
                      friendsModelObj?.socialmedialistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    SocialmedialistItemModel model =
                        friendsModelObj?.socialmedialistItemList[index] ??
                            SocialmedialistItemModel();
                    return SocialmedialistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildFollowList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: BlocSelector<FriendsBloc, FriendsState, FriendsModel?>(
                selector: (state) => state.friendsModelObj,
                builder: (context, friendsModelObj) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.5.v),
                            child: SizedBox(
                                width: double.maxFinite,
                                child: Divider(
                                    height: 2.v,
                                    thickness: 2.v,
                                    color:
                                        theme.colorScheme.secondaryContainer)));
                      },
                      itemCount:
                          friendsModelObj?.followlistItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        FollowlistItemModel model =
                            friendsModelObj?.followlistItemList[index] ??
                                FollowlistItemModel();
                        return FollowlistItemWidget(model);
                      });
                })));
  }

  /// Navigates to the previous screen.
  onTapArrowBack(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  onTapPersonAddAltOne(BuildContext context) async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }
}
