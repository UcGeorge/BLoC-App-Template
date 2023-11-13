import '../stories_and_tweets_screen/widgets/frame1_item_widget.dart';
import '../stories_and_tweets_screen/widgets/live_item_widget.dart';
import 'bloc/stories_and_tweets_bloc.dart';
import 'models/frame1_item_model.dart';
import 'models/live_item_model.dart';
import 'models/stories_and_tweets_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_title_searchview.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';

class StoriesAndTweetsScreen extends StatelessWidget {
  const StoriesAndTweetsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<StoriesAndTweetsBloc>(
        create: (context) => StoriesAndTweetsBloc(StoriesAndTweetsState(
            storiesAndTweetsModelObj: StoriesAndTweetsModel()))
          ..add(StoriesAndTweetsInitialEvent()),
        child: StoriesAndTweetsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_stories".tr,
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 19.v),
                  _buildLIVE(context),
                  SizedBox(height: 22.v),
                  _buildFrame(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: BlocSelector<StoriesAndTweetsBloc, StoriesAndTweetsState,
                TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return AppbarTitleSearchview(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_search".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgGroup9086,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v))
        ]);
  }

  /// Section Widget
  Widget _buildLIVE(BuildContext context) {
    return SizedBox(
        height: 89.v,
        child: BlocSelector<StoriesAndTweetsBloc, StoriesAndTweetsState,
                StoriesAndTweetsModel?>(
            selector: (state) => state.storiesAndTweetsModelObj,
            builder: (context, storiesAndTweetsModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount: storiesAndTweetsModelObj?.liveItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    LiveItemModel model =
                        storiesAndTweetsModelObj?.liveItemList[index] ??
                            LiveItemModel();
                    return LiveItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Expanded(
        child: BlocSelector<StoriesAndTweetsBloc, StoriesAndTweetsState,
                StoriesAndTweetsModel?>(
            selector: (state) => state.storiesAndTweetsModelObj,
            builder: (context, storiesAndTweetsModelObj) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.v),
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                                height: 2.v,
                                thickness: 2.v,
                                color: theme.colorScheme.secondaryContainer)));
                  },
                  itemCount:
                      storiesAndTweetsModelObj?.frame1ItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    Frame1ItemModel model =
                        storiesAndTweetsModelObj?.frame1ItemList[index] ??
                            Frame1ItemModel();
                    return Frame1ItemWidget(model);
                  });
            }));
  }
}
