import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_sides_app/Models/news_data.dart';
import 'package:two_sides_app/Utils/const.dart';
import 'package:two_sides_app/Utils/news_provider.dart';
import 'package:two_sides_app/widgets/detail_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage(this.indexPage, this.brightness, {Key? key}) : super(key: key);

  final int indexPage;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    //getNews();
    return Consumer<NewsProvider>(
      builder: (context, model, child) {
        List<NewsData> newsData = [];
        for (var i = 1; i < model.newsData.length; i++) {
          if (indexPage == 1 && model.newsData[i].category == 'Politics' ||
              indexPage == 2 && model.newsData[i].category == 'Business' ||
              indexPage == 3 && model.newsData[i].category == 'Technology' ||
              indexPage == 4 && model.newsData[i].category == 'Health' ||
              indexPage == 5 && model.newsData[i].category == 'Sport' ||
              indexPage == 6 && model.newsData[i].category == 'Culture') {
            newsData = model.newsData;
          }
        }
        return model.isLoading
            ? const Center(child: CircularProgressIndicator())
            : newsData.isEmpty
                ? const Center(child: Text('No news in the section'))
                : RefreshIndicator(
                    onRefresh: () {
                      return context.read<NewsProvider>().getNews();
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: ListViewNews(
                          brightness: brightness,
                          indexPage: indexPage,
                          model: model),
                    ),
                  );
      },
    );
  }
}

class ListViewNews extends StatelessWidget {
  const ListViewNews({
    Key? key,
    required this.brightness,
    required this.indexPage,
    required this.model,
  }) : super(key: key);

  final Brightness brightness;
  final int indexPage;
  final NewsProvider model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.newsData.length,
      itemBuilder: (BuildContext context, int index) {
        Widget newsCard = Container();
        if (indexPage == 1 && model.newsData[index].category == 'Politics' ||
            indexPage == 2 && model.newsData[index].category == 'Business' ||
            indexPage == 3 && model.newsData[index].category == 'Technology' ||
            indexPage == 4 && model.newsData[index].category == 'Health' ||
            indexPage == 5 && model.newsData[index].category == 'Sport' ||
            indexPage == 6 && model.newsData[index].category == 'Culture') {
          newsCard = NewsCard(
              model.newsData[index].title1 ?? '',
              model.newsData[index].title2 ?? '',
              model.newsData[index].images?.formats.thumbnail.url ?? '',
              model.newsData[index].images?.formats.thumbnail.url ?? '',
              model.newsData[index].media1Logo?.formats.thumbnail.url ?? '',
              model.newsData[index].media2Logo?.formats.thumbnail.url ?? '',
              brightness,
              model.newsData[index].media1Name ?? '',
              model.newsData[index].media2Name ?? '',
              model.newsData[index].category ?? '',
              model.newsData[index].reference1 ?? '',
              model.newsData[index].reference2 ?? '');
        }
        return newsCard;
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final String titleOne,
      titleTwo,
      photoMediaOne,
      photoMediaTwo,
      logoMediaOne,
      logoMediaTwo,
      mediaOneName,
      mediaNameTwo,
      category,
      refOne,
      refTwo;

  final Brightness brightness;

  const NewsCard(
    this.titleOne,
    this.titleTwo,
    this.photoMediaOne,
    this.photoMediaTwo,
    this.logoMediaOne,
    this.logoMediaTwo,
    this.brightness,
    this.mediaOneName,
    this.mediaNameTwo,
    this.category,
    this.refOne,
    this.refTwo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? styleLogoName, styleTitle, styleCategory;
    Color? colors;
    if (brightness == Brightness.dark) {
      styleLogoName = Consts.heading3Dark;
      styleTitle = Consts.heading1DarkOpenSans;
      colors = Colors.grey[800];
      styleCategory = Consts.heading3Dark;
    } else {
      styleLogoName = Consts.heading3Light;
      styleTitle = Consts.heading1LightOpenSans;
      colors = Colors.white;
      styleCategory = Consts.heading3Light;
    }
    return Material(
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 16, 18, 10),
        child: Ink(
          decoration: BoxDecoration(boxShadow: [
            brightness == Brightness.light
                ? const BoxShadow(
                    color: Color(0xFFd6d6d6),
                    offset: Offset(2, 2),
                    blurRadius: 7)
                : const BoxShadow()
          ], color: colors, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              InkWell(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(refOne)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  logoMediaOne,
                                  height: 15,
                                  width: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  mediaOneName,
                                  style: styleLogoName,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 90,
                              child: Text(
                                titleOne,
                                style: styleTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      ClipRRect(
                        child: Image.network(
                          photoMediaOne,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(thickness: 1, height: 1, color: Colors.grey),
              ),
              InkWell(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(refTwo)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            logoMediaTwo,
                            height: 15,
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            mediaNameTwo,
                            style: styleLogoName,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        titleTwo,
                        style: styleTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        category,
                        style: styleCategory,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
