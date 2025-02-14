import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platform_impl.dart';
import 'dart:html' as html;

class PlatformImplWeb implements PlatformImpl {
  @override
  void pushRoute(String path, {bool isBack = false}) {
    print("Pushing route: $path called in web");
    if (isBack) {
      Future.delayed(const Duration(milliseconds: 300), () {
        html.window.history.replaceState({}, html.document.title, path);
      });
    } else {
      html.window.history.pushState({}, html.document.title, path);
    }
  }

  @override
  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title,
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ));
  }
}

PlatformImpl createPlatformImpl() {
  return PlatformImplWeb();
}
