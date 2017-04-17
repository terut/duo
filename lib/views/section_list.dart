import 'package:flutter/material.dart';
import 'sentence_list.dart';
import '../models/section.dart';

class SectionList extends StatefulWidget {
  SectionList({Key key}) : super(key: key);

  var sections = [];

  @override
  _SectionListState createState() => new _SectionListState();
}

class _SectionListState extends State<SectionList> {
  final builder = new SectionBuilder();

  @override
  void initState() {
    super.initState();
    builder.build().then((List<Section> list) {
      setState(() {
        widget.sections = list;
      });
    });
  }

  void _handleSectionSelected(Section section) {
    final route = new MaterialPageRoute<Null>(
        builder: (BuildContext context) => new SentenceList(section: section),
        );
    Navigator.push(context, route);
  }

  Iterable<Widget> _buildBox(BuildContext context) {
    return widget.sections.map((Section section) {
      return new GestureDetector(
          onTap: () {
            _handleSectionSelected(section);
          },
          child: new DecoratedBox(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Theme.of(context).accentColor),
                  ),
              child: new Center(
                  child: new Block(
                      children: [
                        new Text("Section ${section.number}",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            textAlign: TextAlign.center,
                            ),
                        new Text("${section.sentences.length} sentences",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).accentColor),
                            textAlign: TextAlign.center,
                            ),
                      ],
                      ),
                  ),
              ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Duo 3.0'),
            ),
        body: new ScrollableGrid(
            delegate: new FixedColumnCountGridDelegate(
                columnCount: 2,
                tileAspectRatio: 3.0,
                padding: const EdgeInsets.all(4.0),
                columnSpacing: 4.0,
                rowSpacing: 4.0
            ),
            children: _buildBox(context),
            ),
        );
  }
}