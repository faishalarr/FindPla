import 'dart:async';
import 'package:plafinder/pages/detailgunpla.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:plafinder/widget/itemcard.dart';
import 'package:plafinder/model/list_gunpla.dart';

class ExploreGunpla extends StatefulWidget {
  @override
  _ExploreGunplaState createState() => new _ExploreGunplaState();
}

class _ExploreGunplaState extends State<ExploreGunpla> {
  TextEditingController searchController = new TextEditingController();
  String filter = "";
  bool isPressed = false;

  List<Gunpla> gunplas = gunplaList;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.compare_arrows,
                    size: 28,
                  ),
                ),
                label: Text(
                  'Name',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => setState(
                    () => gunplas..sort((a, b) => a.name.compareTo(b.name))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton.icon(
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.compare_arrows,
                      size: 28,
                    ),
                  ),
                  label: Text(
                    'Grade',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => setState(() =>
                      gunplas..sort((a, b) => a.grade.compareTo(b.grade))),
                ),
              ),
            ],
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: gunplas.length,
              itemBuilder: (context, index) {
                return filter == null || filter == ""
                    ? itemCards(index: index)
                    : '${gunplas[index].name} || ${gunplas[index].grade}'
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
}
