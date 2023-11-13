import '../trending_page/widgets/trendingposts_item_widget.dart';
import 'bloc/trending_bloc.dart';
import 'models/trending_model.dart';
import 'models/trendingposts_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key})
      : super(
          key: key,
        );

  @override
  TrendingPageState createState() => TrendingPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<TrendingBloc>(
      create: (context) => TrendingBloc(TrendingState(
        trendingModelObj: TrendingModel(),
      ))
        ..add(TrendingInitialEvent()),
      child: TrendingPage(),
    );
  }
}

class TrendingPageState extends State<TrendingPage>
    with AutomaticKeepAliveClientMixin<TrendingPage> {
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
          child: Column(
            children: [
              SizedBox(height: 23.v),
              _buildTrendingPosts(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTrendingPosts(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: BlocSelector<TrendingBloc, TrendingState, TrendingModel?>(
          selector: (state) => state.trendingModelObj,
          builder: (context, trendingModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 24.v,
                );
              },
              itemCount: trendingModelObj?.trendingpostsItemList.length ?? 0,
              itemBuilder: (context, index) {
                TrendingpostsItemModel model =
                    trendingModelObj?.trendingpostsItemList[index] ??
                        TrendingpostsItemModel();
                return TrendingpostsItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
