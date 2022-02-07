import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:two_sides_app/Utils/circle_indicator.dart';
import 'package:two_sides_app/Utils/const.dart';
import 'package:two_sides_app/Utils/news_provider.dart';
import 'package:two_sides_app/widgets/about_page.dart';
import 'package:two_sides_app/widgets/base_stateful.dart';
import 'package:two_sides_app/widgets/news_page.dart';
import 'package:two_sides_app/widgets/news_page_all.dart';

class HomePage extends BaseStatefull {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  late List<Tab> myTabs;

  @override
  void initState() {
    super.initState();
    myTabs = const [
      Tab(text: "All"),
      Tab(text: "Politics"),
      Tab(text: "Business"),
      Tab(text: "Technology"),
      Tab(text: "Health"),
      Tab(text: "Sport"),
      Tab(text: "Culture")
    ];
    controller = TabController(length: myTabs.length, vsync: this);
    context.read<NewsProvider>().getNews();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: getTitleColor(brightness),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: Platform.isAndroid
                    ? const Icon(Icons.info_outline)
                    : const Icon(CupertinoIcons.info_circle),
              ),
            )
          ],
          bottom: _getDarkTab(brightness, controller)),
      body: TabBarView(
        controller: controller,
        children: [
          NewsPageAll(controller.index, brightness),
          NewsPage(controller.index, brightness),
          NewsPage(controller.index, brightness),
          NewsPage(controller.index, brightness),
          NewsPage(controller.index, brightness),
          NewsPage(controller.index, brightness),
          NewsPage(controller.index, brightness),
        ],
      ),
    );
  }

  PreferredSizeWidget _getDarkTab(Brightness bright,
      [TabController? controller]) {
    PreferredSizeWidget wid;

    if (bright == Brightness.dark) {
      wid = TabBar(
        controller: controller,
        tabs: myTabs,
        isScrollable: true,
        indicator:
            CircleTabIndicator(color: const Color(0xffdc2f02), radius: 3),
      );
    } else {
      wid = TabBar(
        controller: controller,
        tabs: myTabs,
        isScrollable: true,
        labelColor: Colors.white,
        indicatorColor: Colors.blue[800],
        indicator:
            CircleTabIndicator(color: const Color(0xffdc2f02), radius: 3),
      );
    }
    return wid;
  }

  Widget getTitleColor(Brightness bright) {
    Widget wid;
    if (bright == Brightness.dark) {
      wid = Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
        mainAxisAlignment: MainAxisAlignment.center,
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
