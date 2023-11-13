import '../models/stories1_item_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore: must_be_immutable
class Stories1ItemWidget extends StatelessWidget {
  Stories1ItemWidget(
    this.stories1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Stories1ItemModel stories1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.h,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 64.adaptSize,
              width: 64.adaptSize,
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 3.v,
              ),
              decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder32,
              ),
              child: CustomImageView(
                imagePath: stories1ItemModelObj.roy,
                height: 54.v,
                width: 52.h,
                radius: BorderRadius.circular(
                  27.h,
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              stories1ItemModelObj.roy1!,
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
