import 'package:flutter/material.dart' hide SearchController;

import '../../../core/app_export.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../models/search_item_model.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  SearchItemWidget(
    this.searchItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SearchItemModel searchItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 6.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: searchItemModelObj.kevinAllsrub,
            height: 50.adaptSize,
            width: 50.adaptSize,
            radius: BorderRadius.circular(
              25.h,
            ),
            margin: EdgeInsets.only(
              left: 3.h,
              bottom: 6.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 2.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchItemModelObj.kevinAllsrub1!,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 5.v),
                Text(
                  searchItemModelObj.yourEFriendsOn!,
                  style: CustomTextStyles.bodyMediumGray600,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomOutlinedButton(
            width: 76.h,
            text: "lbl_follow".tr,
            margin: EdgeInsets.only(
              top: 9.v,
              bottom: 14.v,
            ),
          ),
        ],
      ),
    );
  }
}
