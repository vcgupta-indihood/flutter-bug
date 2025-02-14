import 'package:flutter/material.dart';

import './platform_impl_stub.dart'
    if (dart.library.html) './platform_impl_web.dart';

abstract class PlatformImpl {
  factory PlatformImpl() => createPlatformImpl();

  void pushRoute(String path, {bool isBack = false});

  void setPageTitle(String title, BuildContext context);
}
