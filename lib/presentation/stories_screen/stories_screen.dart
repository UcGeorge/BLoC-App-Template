import '../stories_screen/widgets/frame_item_widget.dart';
import '../stories_screen/widgets/stories1_item_widget.dart';
import 'bloc/stories_bloc.dart';
import 'models/frame_item_model.dart';
import 'models/stories1_item_model.dart';
import 'models/stories_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/presentation/messages_page/messages_page.dart';
import 'package:george_u_s_application1/presentation/notifications_page/notifications_page.dart';
import 'package:george_u_s_application1/presentation/profile_page/profile_page.dart';
import 'package:george_u_s_application1/presentation/trending_tab_container_page/trending_tab_container_page.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_title_searchview.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:george_u_s_application1/widgets/custom_bottom_bar.dart';

class StoriesScreen extends StatelessWidget {
  StoriesScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<StoriesBloc>(
      create: (context) => StoriesBloc(StoriesState(
        storiesModelObj: StoriesModel(),
      ))
        ..add(StoriesInitialEvent()),
      child: StoriesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 26.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "lbl_stories".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 20.v),
              _buildStories(context),
              SizedBox(height: 21.v),
              _buildPost(context),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "lbl_events".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 16.v),
              _buildFrame(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: BlocSelector<StoriesBloc, StoriesState, TextEditingController?>(
        selector: (state) => state.searchController,
        builder: (context, searchController) {
          return AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "lbl_search".tr,
            controller: searchController,
          );
        },
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgAdd,
          margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildStories(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 89.v,
        child: BlocSelector<StoriesBloc, StoriesState, StoriesModel?>(
          selector: (state) => state.storiesModelObj,
          builder: (context, storiesModelObj) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 16.h,
                );
              },
              itemCount: storiesModelObj?.stories1ItemList.length ?? 0,
              itemBuilder: (context, index) {
                Stories1ItemModel model =
                    storiesModelObj?.stories1ItemList[index] ??
                        Stories1ItemModel();
                return Stories1ItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPost(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse21,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  radius: BorderRadius.circular(
                    25.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 9.v,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_rizal_reynaldhi".tr,
                        style: CustomTextStyles.titleMedium18,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_35_minutes_ago".tr,
                        style: CustomTextStyles.labelMediumBluegray100,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgGroup8916,
                  height: 6.v,
                  width: 30.h,
                  margin: EdgeInsets.symmetric(vertical: 22.v),
                ),
              ],
            ),
            SizedBox(height: 18.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 332.h,
                margin: EdgeInsets.only(right: 17.h),
                child: Text(
                  "msg_most_people_never".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyLargePrimary.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(right: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 17.v,
                    width: 19.h,
                    margin: EdgeInsets.only(
                      top: 5.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      top: 6.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_2200".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorPrimary,
                    height: 18.v,
                    width: 19.h,
                    margin: EdgeInsets.only(
                      left: 29.h,
                      top: 4.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      top: 7.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl_800".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup9078,
                    height: 25.v,
                    width: 54.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return SizedBox(
      height: 201.v,
      child: BlocSelector<StoriesBloc, StoriesState, StoriesModel?>(
        selector: (state) => state.storiesModelObj,
        builder: (context, storiesModelObj) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 16.h,
              );
            },
            itemCount: storiesModelObj?.frameItemList.length ?? 0,
            itemBuilder: (context, index) {
              FrameItemModel model =
                  storiesModelObj?.frameItemList[index] ?? FrameItemModel();
              return FrameItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.trendingTabContainerPage;
      case BottomBarEnum.Streams:
        return "/";
      case BottomBarEnum.Messages:
        return AppRoutes.messagesPage;
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.trendingTabContainerPage:
        return TrendingTabContainerPage.builder(context);
      case AppRoutes.messagesPage:
        return MessagesPage.builder(context);
      case AppRoutes.notificationsPage:
        return NotificationsPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
