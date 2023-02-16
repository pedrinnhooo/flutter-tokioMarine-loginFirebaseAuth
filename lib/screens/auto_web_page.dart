import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class AutoWebPage extends StatefulWidget {
  const AutoWebPage({super.key});

  @override
  State<AutoWebPage> createState() => _AutoWebPageState();
}

class _AutoWebPageState extends State<AutoWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "logoTokio.png",
              width: 100,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.black87,
        elevation: 50.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: HtmlWidget(
          '<iframe src="https://cotacoes.tokiomarine.com.br/massificados/auto/digital/front/#/home"></iframe>',
          factoryBuilder: () => MyWidgetFactory(),
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
