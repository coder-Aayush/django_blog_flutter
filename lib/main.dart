import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wallpro/Screens/detail.dart';
import 'package:wallpro/models/blog.dart';
import 'package:wallpro/services/api_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tech For Best Blog'),
          centerTitle: true,
          elevation: 5,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await getBlogPosts();
          },
          child: FutureBuilder<List<Blog>>(
            future: getBlogPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      elevation: 6,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlogDetailPage(
                                title: data[index].title,
                                thumbnail: data[index].thumbnail,
                                overview: data[index].overview,
                                featured: data[index].featured,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 120,
                              child: Image.network(
                                'http://techforbest.herokuapp.com/static/img/bg4.jpg',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${data[index].title}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      '- By Aayush',
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
