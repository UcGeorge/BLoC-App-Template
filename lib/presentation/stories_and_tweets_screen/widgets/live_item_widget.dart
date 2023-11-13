import '../models/live_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class LiveItemWidget extends StatelessWidget {
  LiveItemWidget(
    this.liveItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LiveItemModel liveItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 64.adaptSize,
              width: 64.adaptSize,
              padding: EdgeInsets.all(15.h),
              decoration: IconButtonStyleHelper.fillDeepPurpleATL32,
              child: CustomImageView(
                imagePath: liveItemModelObj?.send,
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              liveItemModelObj.newPost!,
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
