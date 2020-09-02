import 'package:flutter/material.dart';
import 'package:skeleton/data.dart';

class DetailScreen extends StatelessWidget {
  final PlanetInfo planetInfo;

  DetailScreen(this.planetInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 300),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontSize: 54,
                          ),
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontSize: 31,
                          ),
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 32),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: planetInfo.images.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              planetInfo.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
          ),
          Positioned(
            right: -60,
            child: Hero(
              tag: planetInfo.position,
              child: Image.asset(planetInfo.iconImage),
            ),
          ),
          Positioned(
            top: 60,
            left: 32,
            child: Text(
              planetInfo.position.toString(),
              style:
                  TextStyle(fontSize: 200, color: Color.fromRGBO(0, 0, 0, 0.3)),
            ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    ));
  }
}
