// import 'package:flutter/material.dart';
// import 'package:fn_browser/main.dart';
// import 'package:fn_browser/screens/web_view_container.dart';

// class Home extends StatelessWidget {
//   static final links = ['https://sra.cn.ca'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: Key('123'),
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//         ),
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: links.map((link) => _urlButton(context, link)).toList(),
//         ))));
//   }

//   Widget _urlButton(BuildContext context, String url) {
//     return Container(
//         padding: EdgeInsets.all(20.0),
//         child: FlatButton(
//           color: Theme.of(context).primaryColor,
//           padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
//           child: Text(url),
//           onPressed: () => _handleURLButtonPress(context, url),
//         ));
//   }

//   void _handleURLButtonPress(BuildContext context, String url) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
//   }
// }
