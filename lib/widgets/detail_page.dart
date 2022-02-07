import 'package:flutter/material.dart';
import 'package:two_sides_app/Utils/const.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final String pageUrl;
  const DetailPage(
    this.pageUrl, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
        appBar: AppBar(
          title: _getTitleColor(brightness),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.pageUrl,
        ));
  }

  Widget _getTitleColor(Brightness bright) {
    Widget wid;
    if (bright == Brightness.dark) {
      wid = Row(
        children: [
          Image.asset(
            'assets/images/icon_white.png',
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text('the Quotes', style: Consts.heading1Dark),
        ],
      );
    } else {
      wid = Row(
        children: [
          Image.asset(
            'assets/images/icon_white.png',
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text('the Quotes', style: Consts.heading1Dark),
        ],
      );
    }
    return wid;
  }
}
