import '../models/notifications_item_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore: must_be_immutable
class NotificationsItemWidget extends StatelessWidget {
  NotificationsItemWidget(
    this.notificationsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationsItemModel notificationsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: notificationsItemModelObj.image,
          height: 54.v,
          width: 52.h,
          radius: BorderRadius.circular(
            27.h,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 4.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationsItemModelObj.kevinHasFollowed!,
                  style: CustomTextStyles.titleMediumBlack90001,
                ),
                SizedBox(height: 7.v),
                Text(
                  notificationsItemModelObj.duration!,
                  style: CustomTextStyles.bodyLargeGray600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
