import '../trending_posts_page/widgets/postitem_item_widget.dart';
import 'bloc/trending_posts_bloc.dart';
import 'models/postitem_item_model.dart';
import 'models/trending_posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/app_export.dart';

class TrendingPostsPage extends StatefulWidget {
  const TrendingPostsPage({Key? key}) : super(key: key);

  @override
  TrendingPostsPageState createState() => TrendingPostsPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<TrendingPostsBloc>(
        create: (context) => TrendingPostsBloc(
            TrendingPostsState(trendingPostsModelObj: TrendingPostsModel()))
          ..add(TrendingPostsInitialEvent()),
        child: TrendingPostsPage());
  }
}

class TrendingPostsPageState extends State<TrendingPostsPage>
    with AutomaticKeepAliveClientMixin<TrendingPostsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillPrimary,
                child: Column(children: [
                  SizedBox(height: 17.v),
                  _buildPostItem(context)
                ]))));
  }

  /// Section Widget
  Widget _buildPostItem(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: BlocSelector<TrendingPostsBloc, TrendingPostsState,
                TrendingPostsModel?>(
            selector: (state) => state.trendingPostsModelObj,
            builder: (context, trendingPostsModelObj) {
              return StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.h,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(2);
                  },
                  itemCount:
                      trendingPostsModelObj?.postitemItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    PostitemItemModel model =
                        trendingPostsModelObj?.postitemItemList[index] ??
                            PostitemItemModel();
                    return PostitemItemWidget(model);
                  });
            }));
  }
}
