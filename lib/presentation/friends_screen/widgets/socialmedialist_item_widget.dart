import '../models/socialmedialist_item_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore: must_be_immutable
class SocialmedialistItemWidget extends StatelessWidget {
  SocialmedialistItemWidget(
    this.socialmedialistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SocialmedialistItemModel socialmedialistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.h,
      child: CustomImageView(
        imagePath: socialmedialistItemModelObj.twitter,
        height: 50.adaptSize,
        width: 50.adaptSize,
      ),
    );
  }
}
