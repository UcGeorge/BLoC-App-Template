import '../invite_friends_screen/widgets/invitefriends_item_widget.dart';
import 'bloc/invite_friends_bloc.dart';
import 'models/invite_friends_model.dart';
import 'models/invitefriends_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:george_u_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:george_u_s_application1/widgets/app_bar/custom_app_bar.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<InviteFriendsBloc>(
        create: (context) => InviteFriendsBloc(
            InviteFriendsState(inviteFriendsModelObj: InviteFriendsModel()))
          ..add(InviteFriendsInitialEvent()),
        child: InviteFriendsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_invite_friends".tr,
                              style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 15.v),
                      _buildInviteFriends(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgClose,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapClose(context);
            }),
        actions: [
          AppbarSubtitleOne(
              text: "lbl_next".tr,
              margin: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildInviteFriends(BuildContext context) {
    return Expanded(
        child: BlocSelector<InviteFriendsBloc, InviteFriendsState,
                InviteFriendsModel?>(
            selector: (state) => state.inviteFriendsModelObj,
            builder: (context, inviteFriendsModelObj) {
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
                                color: theme.colorScheme.secondaryContainer)));
                  },
                  itemCount:
                      inviteFriendsModelObj?.invitefriendsItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    InvitefriendsItemModel model =
                        inviteFriendsModelObj?.invitefriendsItemList[index] ??
                            InvitefriendsItemModel();
                    return InvitefriendsItemWidget(model);
                  });
            }));
  }

  /// Navigates to the previous screen.
  onTapClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
