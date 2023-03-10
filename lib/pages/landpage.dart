import 'package:flutter/material.dart';
import 'package:plafinder/widget/itemcard.dart';
import 'package:plafinder/model/list_gunpla.dart';
import 'package:plafinder/model/list_twfm.dart';
import 'package:plafinder/pages/exploregunpla.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plafinder/pages/aboutgunpla.dart';
import 'package:plafinder/widget/drawerwidget.dart';
import 'package:plafinder/widget/twfmcard.dart';

class LandPage extends StatefulWidget {
  LandPage({Key? key}) : super(key: key);

  @override
  _LandPageState createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<String> imageList = [
    "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/02/01/1146653798.jpeg",
    "https://lh3.googleusercontent.com/proxy/yL2FmQfZA79S5eIDza9MH2NjKGIKWPOGRHxHdYwiNPcYDW26YmK6qnP01ZDLsBENZpiADc1ohkj3LzVjrwoX8Pb-crT6MYZb3Jp9gy3ZrlET_yvoFS0qtUHLq4DtVPcqIdxPiNWI_j08omBVACv-YJc",
    "https://images.hdqwalls.com/download/spiderman-peter-parker-standing-on-a-rooftop-ix-1280x720.jpg",
    "https://images.wallpapersden.com/image/download/peter-parker-spider-man-homecoming_bGhsa22UmZqaraWkpJRmZ21lrWxnZQ.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUgui-suS8DgaljlONNuhy4vPUsC_UKvxJQ&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              height: height * 0.075,
              color: Colors.blue,
              child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 5),
                        child: IconButton(
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                            icon: Icon(
                              Icons.person,
                              size: 30,
                            )),
                      ),
                      Text(
                        'FindPla',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                            child: const Icon(
                              Icons.info,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const aboutGunpla()),
                              );
                            }),
                      )
                    ],
                  ))),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(e,
                                  width: 1050,
                                  height: 350,
                                  fit: BoxFit.fill, loadingBuilder:
                                      (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;

                                return Center(
                                    child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ));
                                // You can use LinearProgressIndicator or CircularProgressIndicator instead
                              })
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                    child: Text(
                      'Find Your Gunpla:',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30, right: 10, bottom: 20),
                      child: InkWell(
                          child: Text(
                            'Explore more ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreGunpla()),
                            );
                          }))
                ],
              )
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: twfmList.length,
              itemBuilder: (context, int key) {
                return TwfmCards(
                  index: key,
                );
              },
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: gunplaList.length,
              itemBuilder: (context, int key) {
                return itemCards(
                  index: key,
                );
              },
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ))),
    );
  }
}
