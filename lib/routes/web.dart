//import 'dart:html';

import 'package:flutter_app/markdown/widget.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html2md/html2md.dart' as html2md;

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  String _markdownBody = '';

  String parseUrl(String html) {
    Document document = parse(html);
    var content = document.getElementById('content');
    return content.outerHtml;
  }

  void fetchHTML(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String content = parseUrl(response.body);
//      debugPrint(content);
      String markdown = html2md.convert(content, rootTag: 'article');
//      debugPrint(markdown);
      setState(() {
        _markdownBody = markdown;
      });
    } else {
      debugPrint('fetchHTML() failed');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchHTML('https://daodu.tech/11-06-2019-google-acquire-fitbit-wearables-drawn-into-phone-gravity');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MarkdownBody(data: _markdownBody),
    );
  }
}