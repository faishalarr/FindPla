import 'dart:async';
import 'package:plafinder/model/list_series.dart';
import 'package:plafinder/pages/detailgunpla.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:plafinder/widget/seriescard.dart';

class TvSeries extends StatefulWidget {
  @override
  _TvSeriesStateState createState() => new _TvSeriesStateState();
}

class _TvSeriesStateState extends State<TvSeries> {
  TextEditingController searchController = new TextEditingController();
  String filter = "";

  List<SeriesModel> series = serieslist;

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
            child: new TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Enter name or grade',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        BorderSide(color: Colors.lightGreen, width: 2.5),
                  )),
            ),
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: series.length,
              itemBuilder: (context, index) {
                return filter == null || filter == ""
                    ? SeriesCard(index: index)
                    : '${series[index].name}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? SeriesCard(index: index)
                        : new Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
