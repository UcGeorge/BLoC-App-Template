import '../models/forty_item_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class FortyItemWidget extends StatelessWidget {
  FortyItemWidget(
    this.fortyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FortyItemModel fortyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 167.h,
      child: CustomImageView(
        imagePath: fortyItemModelObj?.forty,
        height: 167.adaptSize,
        width: 167.adaptSize,
        radius: BorderRadius.circular(
          10.h,
        ),
      ),
    );
  }
}
