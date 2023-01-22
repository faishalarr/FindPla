import 'dart:async';
import 'package:plafinder/pages/detailgunpla.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:plafinder/itemcard.dart';
import 'package:plafinder/list_gunpla.dart';

class ExploreGunpla extends StatefulWidget {
  @override
  _ExploreGunplaState createState() => new _ExploreGunplaState();
}

class _ExploreGunplaState extends State<ExploreGunpla> {
  TextEditingController searchController = new TextEditingController();
  String filter = "";

  List<Gunpla> gunplas = gunplaList;

  // Get json result and convert it to model. Then add

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
        body: SafeArea(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search',
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
              itemCount: gunplas.length,
              itemBuilder: (context, index) {
                return filter == null || filter == ""
                    ? itemCards(index: index)
                    : '${gunplas[index].name}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? itemCards(index: index)
                        : new Container();
              },
            ),
          ),
        ],
      ),
    ));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.name.contains(text)) ;
    });

    setState(() {});
  }
}

List<Gunpla> _searchResult = gunplaList;

List<Gunpla> _userDetails = gunplaList;
