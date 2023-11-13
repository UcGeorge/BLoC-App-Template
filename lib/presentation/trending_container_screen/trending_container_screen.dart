import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../messages_page/messages_page.dart';
import '../notifications_page/notifications_page.dart';
import '../profile_page/profile_page.dart';
import '../trending_tab_container_page/trending_tab_container_page.dart';
import 'bloc/trending_container_bloc.dart';
import 'models/trending_container_model.dart';

// ignore_for_file: must_be_immutable
class TrendingContainerScreen extends StatelessWidget {
  TrendingContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<TrendingContainerBloc>(
        create: (context) => TrendingContainerBloc(TrendingContainerState(
            trendingContainerModelObj: TrendingContainerModel()))
          ..add(TrendingContainerInitialEvent()),
        child: TrendingContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<TrendingContainerBloc, TrendingContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.trendingTabContainerPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.trendingTabContainerPage;
      case BottomBarEnum.Streams:
        return "/";
      case BottomBarEnum.Messages:
        return AppRoutes.messagesPage;
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.trendingTabContainerPage:
        return TrendingTabContainerPage.builder(context);
      case AppRoutes.messagesPage:
        return MessagesPage.builder(context);
      case AppRoutes.notificationsPage:
        return NotificationsPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
