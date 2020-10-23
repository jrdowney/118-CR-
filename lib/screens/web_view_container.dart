import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fn Browser"),
          leading: GestureDetector(
            onTap: () {
              print("Help Button Clicked");
              Navigator.pushNamed(context, "/help");
            },
            child: Icon(
              Icons.help,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print("Settings Button Clicked");
                    Navigator.pushNamed(context, "/settings");
                  },
                  child: Icon(
                    Icons.settings,
                    size: 26.0,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              // child: GestureDetector(
              //   onTap: () {},
              //   child: Icon(Icons.more_vert),
              // )
            ),
          ],
          backgroundColor: Colors.grey[700],
        ),
        body: Container(
            child: Column(children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(20.0),
          //   child: Text(
          //       "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: InAppWebView(
                initialUrl: "https://sra.cn.ca",
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  if (_webViewController != null) {
                    _webViewController.goBack();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_webViewController != null) {
                    _webViewController.goForward();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  if (_webViewController != null) {
                    _webViewController.reload();
                  }
                },
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('F5'),
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  if (_webViewController != null) {
                    _webViewController.reload();
                  }
                },
              ),
            ],
          ),
        ])),
      ),
    );
  }
}
