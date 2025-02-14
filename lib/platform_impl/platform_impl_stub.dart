import 'package:flutter/material.dart';
import 'platform_impl.dart';

class PlatformImplStub implements PlatformImpl {
  @override
  void pushRoute(String path, {bool isBack = false}) {
    // Do nothing for IO
  }
  @override
  void setPageTitle(String title, BuildContext context) {
    // Do nothing for IO
  }
}

PlatformImpl createPlatformImpl() {
  return PlatformImplStub();
}
