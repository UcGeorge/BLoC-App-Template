import '../models/messages_item_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore: must_be_immutable
class MessagesItemWidget extends StatelessWidget {
  MessagesItemWidget(
    this.messagesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MessagesItemModel messagesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 21.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 54.v,
            width: 52.h,
            margin: EdgeInsets.only(bottom: 1.v),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse22,
                  height: 54.v,
                  width: 52.h,
                  radius: BorderRadius.circular(
                    27.h,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 13.adaptSize,
                    width: 13.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.green600,
                      borderRadius: BorderRadius.circular(
                        6.h,
                      ),
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                top: 2.v,
                bottom: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        messagesItemModelObj.richardAlves!,
                        style: CustomTextStyles.titleMediumBlack90001,
                      ),
                      Text(
                        messagesItemModelObj.time!,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    messagesItemModelObj.heyBroWhereAre!,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
