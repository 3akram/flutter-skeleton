import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'screens/detail_screen.dart';

import 'package:skeleton/data.dart';
import 'package:skeleton/providers/ThemeChanger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).getTheme();
    return MaterialApp(
      title: 'Flutter Skeleton',
      theme: theme,
      home: MyHomePage(title: 'Flutter Skeleton'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 500,
          child: CardSwiper(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: planets.length,
      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
        activeSize: 20,
      )),
      layout: SwiperLayout.STACK,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailScreen(
                    planets[index],
                  ),
                ));
          },
          child: Stack(children: [
            Column(children: [
              SizedBox(height: 100),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Text(
                        planets[index].name,
                        style: TextStyle(
                          fontSize: 44,
                        ),
                      ),
                      Text(
                        "Solar System",
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Know more',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Hero(
              tag: planets[index].position,
              child: Image.asset(planets[index].iconImage),
            ),
          ]),
        );
      },
    );
  }
}
