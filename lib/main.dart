import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Web Views',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Arial",
            textTheme: TextTheme(
                button: TextStyle(color: Colors.white, fontSize: 18.0),
                title: TextStyle(color: Colors.red))),
        home: Home()
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading =true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: "https://www.app.orloprachar.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? Center( child: CircularProgressIndicator(),)
            : Stack(),
      ],
    );
  }
}

