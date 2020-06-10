import 'package:corona_app/src/constants/colors.dart';
import 'package:corona_app/src/models/news.dart';
import 'package:corona_app/src/providers/news_api.dart';
import 'package:corona_app/src/widgets/spacer/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news-screen';
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<News>> news;

  @override
  void initState() {
    news = context.read<NewsProvider>().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firstNews = context.watch<NewsProvider>().firstNews;
    final news = context.watch<NewsProvider>().news;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                firstNews.title.substring(0, 50) + '...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: Image.network(
                      firstNews.urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 70,
                    child: Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFA5252),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Highlights',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.black.withOpacity(.2),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
              if (i == 0) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Related News',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: FadeInImage(
                            placeholder:
                                AssetImage('assets/images/no_image.jpg'),
                            image: NetworkImage(
                              news[i].urlToImage ??
                                  'https://www.hertrack.com/wp-content/uploads/2018/10/no-image.jpg',
                            ),
                          ),
                        ),
                        title: Text(
                          news[i].publishedAt.substring(11, 19) ?? 'No date',
                          style: TextStyle(
                            fontSize: 12,
                            color: kHintRed,
                            letterSpacing: 2,
                          ),
                        ),
                        subtitle: Text(
                          news[i].title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              }
            }, childCount: news.length),
          )
        ],
      ),
    );
  }
}
