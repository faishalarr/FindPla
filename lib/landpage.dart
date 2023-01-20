import 'package:flutter/material.dart';
import 'package:plafinder/list_gunpla.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plafinder/aboutgunpla.dart';

class LandPage extends StatelessWidget {
  final List<String> imageList = [
    "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/02/01/1146653798.jpeg",
    "https://lh3.googleusercontent.com/proxy/yL2FmQfZA79S5eIDza9MH2NjKGIKWPOGRHxHdYwiNPcYDW26YmK6qnP01ZDLsBENZpiADc1ohkj3LzVjrwoX8Pb-crT6MYZb3Jp9gy3ZrlET_yvoFS0qtUHLq4DtVPcqIdxPiNWI_j08omBVACv-YJc",
    "https://images.hdqwalls.com/download/spiderman-peter-parker-standing-on-a-rooftop-ix-1280x720.jpg",
    "https://images.wallpapersden.com/image/download/peter-parker-spider-man-homecoming_bGhsa22UmZqaraWkpJRmZ21lrWxnZQ.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUgui-suS8DgaljlONNuhy4vPUsC_UKvxJQ&usqp=CAU",
  ];

  LandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'FindPla',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
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
                          })
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
                              Image.network(
                                e,
                                width: 1050,
                                height: 350,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Container()
        ],
      ))),
    );
  }
}
