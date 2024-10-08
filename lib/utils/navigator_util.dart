import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uuvpn/pages/accountPage.dart';
import 'package:uuvpn/pages/crisp_page.dart';
import 'package:uuvpn/pages/plan/plan_page.dart';
import 'package:uuvpn/pages/server_list.dart';
import 'package:uuvpn/router/application.dart';
import 'package:uuvpn/router/routers.dart';

class NavigatorUtil {
  static goHomePage(BuildContext context) {
    Application.router?.navigateTo(context, Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goLogin(BuildContext context) {
    Application.router?.navigateTo(context, Routers.login,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goPlan(BuildContext context) {
    showCupertinoModalBottomSheet(
        context: context, builder: (context) => const PlanPage());
    // Application.router.navigateTo(context, Routers.plan,
    //     transition: TransitionType.inFromRight);
  }

  static goSettings(BuildContext context) {
    // showCupertinoModalBottomSheet(
    //     context: context, builder: (context) => const AccountPage());
    // Application.router.navigateTo(context, Routers.plan,
    //     transition: TransitionType.inFromRight);
    // Application.router?.navigateTo(context, Routers.account,
    //     transition: TransitionType.inFromRight, replace: true);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (builder) => const AccountPage()));
  }

  static goServerList(BuildContext context) {
    // showCupertinoModalBottomSheet(
    //     context: context, builder: (context) => const ServerListPage());

    showCupertinoModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height /
              1.3, // set height to half of the screen
          child: Center(
            child: const ServerListPage(),
          ),
        );
      },
    );

    // Application.router.navigateTo(context, Routers.serverList,
    //     transition: TransitionType.inFromRight);
  }

  static goToCrisp(BuildContext context) {
    showCupertinoModalBottomSheet(
        context: context, builder: (context) => const CrispPage());
  }

  static goWebView(BuildContext context, String titleName, String url) {
    String encodeUrl = Uri.encodeComponent(jsonEncode(url));
    String encodeTitleName = Uri.encodeComponent(jsonEncode(titleName));
    return Application.router?.navigateTo(
        context, "${Routers.webView}?titleName=$encodeTitleName&url=$encodeUrl",
        transition: TransitionType.inFromRight);
  }

  static goBack(BuildContext context) {
    Application.router?.pop(context);
  }
}
