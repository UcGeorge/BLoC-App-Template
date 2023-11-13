import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../stream_page/widgets/stream_item_widget.dart';
import 'bloc/stream_bloc.dart';
import 'models/stream_item_model.dart';
import 'models/stream_model.dart';

// ignore_for_file: must_be_immutable
class StreamPage extends StatefulWidget {
  const StreamPage({Key? key})
      : super(
          key: key,
        );

  @override
  StreamPageState createState() => StreamPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<StreamBloc>(
      create: (context) => StreamBloc(StreamState(
        streamModelObj: StreamModel(),
      ))
        ..add(StreamInitialEvent()),
      child: StreamPage(),
    );
  }
}

class StreamPageState extends State<StreamPage>
    with AutomaticKeepAliveClientMixin<StreamPage> {
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
              SizedBox(height: 17.v),
              _buildStream(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStream(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 602.v,
        child: BlocSelector<StreamBloc, StreamState, StreamModel?>(
          selector: (state) => state.streamModelObj,
          builder: (context, streamModelObj) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 16.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 21.h,
                );
              },
              itemCount: streamModelObj?.streamItemList.length ?? 0,
              itemBuilder: (context, index) {
                StreamItemModel model =
                    streamModelObj?.streamItemList[index] ?? StreamItemModel();
                return StreamItemWidget(
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
