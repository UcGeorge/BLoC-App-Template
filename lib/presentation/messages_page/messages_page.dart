import '../messages_page/widgets/messages_item_widget.dart';
import '../messages_page/widgets/stories2_item_widget.dart';
import 'bloc/messages_bloc.dart';
import 'models/messages_item_model.dart';
import 'models/messages_model.dart';
import 'models/stories2_item_model.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MessagesBloc>(
        create: (context) =>
            MessagesBloc(MessagesState(messagesModelObj: MessagesModel()))
              ..add(MessagesInitialEvent()),
        child: MessagesPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_messages".tr,
                              style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 18.v),
                      _buildStories(context),
                      SizedBox(height: 23.v),
                      _buildMessages(context)
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
              imagePath: ImageConstant.imgAddDeepPurpleA200,
              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildStories(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 81.v,
            child: BlocSelector<MessagesBloc, MessagesState, MessagesModel?>(
                selector: (state) => state.messagesModelObj,
                builder: (context, messagesModelObj) {
                  return ListView.separated(
                      padding: EdgeInsets.only(left: 16.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 20.h);
                      },
                      itemCount: messagesModelObj?.stories2ItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        Stories2ItemModel model =
                            messagesModelObj?.stories2ItemList[index] ??
                                Stories2ItemModel();
                        return Stories2ItemWidget(model);
                      });
                })));
  }

  /// Section Widget
  Widget _buildMessages(BuildContext context) {
    return Expanded(
        child: BlocSelector<MessagesBloc, MessagesState, MessagesModel?>(
            selector: (state) => state.messagesModelObj,
            builder: (context, messagesModelObj) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.5.v),
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                                height: 2.v,
                                thickness: 2.v,
                                color: theme.colorScheme.secondaryContainer)));
                  },
                  itemCount: messagesModelObj?.messagesItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    MessagesItemModel model =
                        messagesModelObj?.messagesItemList[index] ??
                            MessagesItemModel();
                    return MessagesItemWidget(model);
                  });
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowBack(BuildContext context) {
    NavigatorService.goBack();
  }
}
