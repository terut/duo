import 'package:flutter/material.dart';
import '../models/sentence.dart';
import 'sentence_view.dart';

typedef void SentenceSelectedCallback(Sentence sentence);

class SentenceListItem extends StatelessWidget {
  SentenceListItem({Sentence sentence, this.onSentenceSelected})
      : sentence = sentence,
        super(key: new ObjectKey(sentence));

  final Sentence sentence;
  final SentenceSelectedCallback onSentenceSelected;

  Color _getColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    return new TextStyle(fontFamily: "Hiragino Kaku Gothic ProN");
  }

  @override
  Widget build(BuildContext context) {
    return new ListItem(
        onTap: () {
          onSentenceSelected(sentence);
          //onCartChanged(product, !inCart);
        },
        leading: new CircleAvatar(
            backgroundColor: _getColor(context),
            child: new Text(sentence.number),
            ),
        title: new Text(sentence.jp, style: _getTextStyle(context)),
        dense: true,
        );
  }
}

class SentenceList extends StatefulWidget {
  SentenceList({Key key, this.section}) : super(key: key);

  final section;

  @override
  _SentenceListState createState() => new _SentenceListState();
}

class _SentenceListState extends State<SentenceList> {

//  @override
//  void initState() {
//    super.initState();
//    setState(() {
//    });
//  }

  void _handleSentenceSelected(Sentence sentence) {
    final route = new MaterialPageRoute<Null>(
        builder: (BuildContext context) => new SentenceView(sentence: sentence),
        );
    Navigator.push(context, route);
  }

  Iterable<Widget> _buildList() {
    return widget.section.sentences.map((Sentence sentence) {
      return new SentenceListItem(
          sentence: sentence,
          onSentenceSelected: _handleSentenceSelected,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Section ${widget.section.number}'),
            ),
        body: new MaterialList(
            type: MaterialListType.twoLine,
            children: _buildList(),
            ),
        );
  }
}