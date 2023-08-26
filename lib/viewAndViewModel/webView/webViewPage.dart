import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';



class webViewPage extends StatelessWidget {
  webViewPage({Key? key, required this.url}) : super(key: key);
  var url;
  RxBool is_loading = true.obs;

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) {
          is_loading.value = false;
        },
        onWebResourceError: (_) {
          is_loading.value = false;
        },

      ))
      ..loadRequest(Uri.parse(url));
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Obx(
              () => SafeArea(child: availableNews(is_loading.value, controller)),
        ),
      ),
    );
  }
}

Widget availableNews(is_loading, controller) {
  if (is_loading) {
    return Center(
      child: CircularProgressIndicator()
          .box
          .height(20)
          .width(20)
          .make(),
    );
  }
  return  WebViewWidget(
    controller: controller,
  );
}
