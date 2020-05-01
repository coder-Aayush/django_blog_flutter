import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class BlogDetailPage extends StatefulWidget {
  final title;
  final thumbnail;
  final overview;
  final featured;
  BlogDetailPage({this.title, this.thumbnail, this.overview, this.featured});
  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    final String customizeoveriew = widget.overview;
    final styleRegex = RegExp(r' style=\"([^"]*)\"');
    var overviewWithStrippedStyle =
        customizeoveriew.replaceAll(styleRegex, '').replaceAll('&nbsp;', '');
    // var document = parse(overviewWithStrippedStyle);
    // print(document.outerHtml);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(12),
          child: HtmlView(
            data: overviewWithStrippedStyle,
          ),
        ),
      ),
    );
  }
}

// name, email, phone no,
