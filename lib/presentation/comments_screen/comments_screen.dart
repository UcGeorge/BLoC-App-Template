import '../comments_screen/widgets/commentlist_item_widget.dart';
import 'bloc/comments_bloc.dart';
import 'models/commentlist_item_model.dart';
import 'models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:george_u_s_application1/core/app_export.dart';
import 'package:george_u_s_application1/widgets/custom_icon_button.dart';
import 'package:george_u_s_application1/widgets/custom_text_form_field.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CommentsBloc>(
        create: (context) =>
            CommentsBloc(CommentsState(commentsModelObj: CommentsModel()))
              ..add(CommentsInitialEvent()),
        child: CommentsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgClose,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          onTap: () {
                            onTapImgClose(context);
                          }),
                      SizedBox(height: 34.v),
                      Text("lbl_comments".tr,
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 21.v),
                      _buildCommentList(context)
                    ])),
            bottomNavigationBar: _buildCommentBox(context)));
  }

  /// Section Widget
  Widget _buildCommentList(BuildContext context) {
    return Expanded(
        child: BlocSelector<CommentsBloc, CommentsState, CommentsModel?>(
            selector: (state) => state.commentsModelObj,
            builder: (context, commentsModelObj) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.v),
                        child: SizedBox(
                            width: 382.h,
                            child: Divider(
                                height: 2.v,
                                thickness: 2.v,
                                color: theme.colorScheme.secondaryContainer)));
                  },
                  itemCount: commentsModelObj?.commentlistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    CommentlistItemModel model =
                        commentsModelObj?.commentlistItemList[index] ??
                            CommentlistItemModel();
                    return CommentlistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildCommentBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 39.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: BlocSelector<CommentsBloc, CommentsState,
                      TextEditingController?>(
                  selector: (state) => state.commentController,
                  builder: (context, commentController) {
                    return CustomTextFormField(
                        controller: commentController,
                        hintText: "lbl_write_a_comment".tr,
                        textInputAction: TextInputAction.done,
                        borderDecoration:
                            TextFormFieldStyleHelper.fillSecondaryContainer,
                        fillColor: theme.colorScheme.secondaryContainer);
                  })),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: CustomIconButton(
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  padding: EdgeInsets.all(13.h),
                  decoration: IconButtonStyleHelper.fillDeepPurpleATL25,
                  child:
                      CustomImageView(imagePath: ImageConstant.imgGroup9143)))
        ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
