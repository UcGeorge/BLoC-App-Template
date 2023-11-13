import '../trending_tab_container_page/widgets/stories_item_widget.dart';
import 'bloc/trending_tab_container_bloc.dart';
import 'models/stories_item_model.dart';
import 'models/trending_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/presentation/trending_page/trending_page.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_title_searchview.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';

class TrendingTabContainerPage extends StatefulWidget {
  const TrendingTabContainerPage({Key? key}) : super(key: key);

  @override
  TrendingTabContainerPageState createState() =>
      TrendingTabContainerPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<TrendingTabContainerBloc>(
        create: (context) => TrendingTabContainerBloc(TrendingTabContainerState(
            trendingTabContainerModelObj: TrendingTabContainerModel()))
          ..add(TrendingTabContainerInitialEvent()),
        child: TrendingTabContainerPage());
  }
}

// ignore_for_file: must_be_immutable
class TrendingTabContainerPageState extends State<TrendingTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
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
                  SizedBox(height: 25.v),
                  _buildStories(context),
                  SizedBox(height: 33.v),
                  _buildTabview(context),
                  Expanded(
                      child: SizedBox(
                          height: 544.v,
                          child: TabBarView(
                              controller: tabviewController,
                              children: [
                                TrendingPage.builder(context),
                                TrendingPage.builder(context),
                                TrendingPage.builder(context),
                                TrendingPage.builder(context)
                              ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: BlocSelector<TrendingTabContainerBloc, TrendingTabContainerState,
                TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return AppbarTitleSearchview(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_search".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgProfile40x40,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v))
        ]);
  }

  /// Section Widget
  Widget _buildStories(BuildContext context) {
    return SizedBox(
        height: 89.v,
        child: BlocSelector<TrendingTabContainerBloc, TrendingTabContainerState,
                TrendingTabContainerModel?>(
            selector: (state) => state.trendingTabContainerModelObj,
            builder: (context, trendingTabContainerModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount:
                      trendingTabContainerModelObj?.storiesItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    StoriesItemModel model =
                        trendingTabContainerModelObj?.storiesItemList[index] ??
                            StoriesItemModel();
                    return StoriesItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
        height: 30.v,
        width: 398.h,
        child: TabBar(
            controller: tabviewController,
            isScrollable: true,
            labelColor: appTheme.deepPurpleA200,
            unselectedLabelColor: appTheme.indigo100,
            tabs: [
              Tab(child: Text("lbl_trending".tr)),
              Tab(child: Text("lbl_latest".tr)),
              Tab(child: Text("lbl_discover".tr)),
              Tab(child: Text("lbl_daily_new".tr))
            ]));
  }
}
