import '../models/invitefriends_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class InvitefriendsItemWidget extends StatelessWidget {
  InvitefriendsItemWidget(
    this.invitefriendsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  InvitefriendsItemModel invitefriendsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 5.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: invitefriendsItemModelObj?.kevinAllsrub,
            height: 50.adaptSize,
            width: 50.adaptSize,
            radius: BorderRadius.circular(
              25.h,
            ),
            margin: EdgeInsets.only(bottom: 8.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 2.v,
              bottom: 7.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invitefriendsItemModelObj.kevinAllsrub1!,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 5.v),
                Text(
                  invitefriendsItemModelObj.yourEFriendsOn!,
                  style: CustomTextStyles.bodyMediumGray500,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 13.v,
              bottom: 21.v,
            ),
            child: CustomIconButton(
              height: 24.adaptSize,
              width: 24.adaptSize,
              padding: EdgeInsets.all(6.h),
              child: CustomImageView(
                imagePath: invitefriendsItemModelObj?.checkmark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
