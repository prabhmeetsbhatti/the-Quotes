import 'package:flutter/material.dart';
import 'package:two_sides_app/Utils/const.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    TextStyle? styleMainTitle, styleTitle, styleName;
    if (brightness == Brightness.dark) {
      styleMainTitle = Consts.heading1Dark;
      styleTitle = Consts.heading2Dark;
      styleName = Consts.heading3DarkName;
    } else {
      styleMainTitle = Consts.heading1Light;
      styleTitle = Consts.heading2Light;
      styleName = Consts.heading3LightName;
    }
    return Scaffold(
        appBar: AppBar(
          title: _getTitleColor(brightness),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text('The Quotes media (Version 1.0.0)',
                    style: styleMainTitle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Text(
                    'This project comes as a response to the ever present and sometimes blatant media bias.\n\nWe aim through it to provide our community with a bigger picture to approach the truth and have an objective standpoint. This is a platform that accumulates the most current news from two different point of views and radically different sources. So that each individual can form his or her own opinion.',
                    style: styleTitle,
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text('Project team:', style: styleMainTitle),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/houda.jpg',
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text('Houda Jaouhari\n(Morocco)',
                                style: styleName, textAlign: TextAlign.center),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text('Preliminary research',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text('Content creation',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child:
                                      Text('Manual testing', style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child:
                                      Text('Documentation', style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text('Legalities', style: styleTitle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(thickness: 1, height: 1, color: Colors.grey),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/dmitrii.jpg',
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Dmitry Kotikov \n(Russia)',
                              style: styleName,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text('Project conceptualization',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text(
                                      'Static site generated front-end development',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text(
                                      'Headless CMS back-end development',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(thickness: 1, height: 1, color: Colors.grey),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/prabhmeet.jpg',
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text('Prabhmeet S Bhatti\n(India)',
                                style: styleName, textAlign: TextAlign.center),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('•  ', style: styleTitle),
                                Expanded(
                                  child: Text(
                                      'Development and maintenance of the Android/iOS Applications',
                                      style: styleTitle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
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
