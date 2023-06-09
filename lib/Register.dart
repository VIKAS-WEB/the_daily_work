import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var isLoading = false;
  late final WebViewController controller;
  late bool _isLoading;
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  double progress = 0;
  var urlController = TextEditingController();
  var initialUrl = "https://thedailywork.in/employee_signup.php";
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  var isAlertSet = false;

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        } else {}
      });
  @override
  void dispose() {
    super.dispose();
  }

//Pull To Refresh Code Initialize Here
  @override
  void initState() {
    //Loading

    //ends
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    getConnectivity();
    super.initState();
    // Loading Screen When WebView Was Loading...
    //Code Ends Here
    refreshController = PullToRefreshController(
        onRefresh: () {
          webViewController!.reload();
        },
        options: PullToRefreshOptions(
          color: Colors.white,
          backgroundColor: Color(
            (0xFF2557a7),
          ),
        ));
  }
  //Code Ends here

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (await webViewController!.canGoBack()) {
              webViewController!.goBack();
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: TextField(
            onSubmitted: (value) {
              url = Uri.parse(value);

              if (url.scheme.isEmpty) {
                url = Uri.parse("${initialUrl}search?q=$value");
              }
              webViewController!.loadUrl(urlRequest: URLRequest(url: url));
            },
            controller: urlController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                webViewController!.reload();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              InAppWebView(
                //code to Show Url on Search Area

                onLoadStart: (controller, url) {
                  var v = url.toString();
                  setState(() {
                    isLoading = true;
                    urlController.text = v;
                  });
                },

                //code ends here

                //Pull To Refresh Code//
                onLoadStop: (controller, url) {
                  refreshController!.endRefreshing();
                  setState(() {
                    isLoading = false;
                  });
                },
                pullToRefreshController: refreshController,
                //Pull To Refresh Code Ends Here

                onWebViewCreated: (controller) =>
                    webViewController = controller,
                initialUrlRequest: URLRequest(
                  url: Uri.parse(initialUrl),
                ),
              ),
              Visibility(
                  visible: isLoading,
                  child: SpinKitChasingDots(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Color.fromARGB(255, 54, 133, 244)
                              : Color.fromARGB(255, 81, 209, 245),
                        ),
                      );
                    },
                  ))
            ],
          ))
        ],
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('No  Internet Connection '),
            content: const Text('Please check your internet connectivity'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          ));
}
