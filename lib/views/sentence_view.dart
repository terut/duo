import 'package:flutter/material.dart';

class SentenceView extends StatefulWidget {
  SentenceView({Key key, this.sentence}) : super(key: key);

  final sentence;

  @override
  _SentenceViewState createState() => new _SentenceViewState();
}

class _SentenceViewState extends State<SentenceView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _inputSentence;
  bool _validSentence;

  void _handleSubmitted() {
    _formKey.currentState.save();

    setState(() {
      if(_inputSentence != widget.sentence.en) {
        _validSentence = false;
      } else {
        _validSentence = true;
      }
    });
  }

  Iterable<Widget> _buildView() {
    var text = null;
    if(_validSentence != null) {
      var color;
      if(_validSentence) {
        color = Colors.green[200];
      } else {
        color = Colors.red[200];
      }
      text = new Text(
          widget.sentence.en,
          style: new TextStyle(color: color),
          );
    }

    var views = [
      new SizedBox(
          height: 65.0,
          child: new Text(
              widget.sentence.jp,
              style: new TextStyle(fontFamily: "Hiragino Kaku Gothic ProN"),
              ),
          ),
      new SizedBox(
          height: 65.0,
          child: text,
          ),
      new Form(
          key: _formKey,
          child: new Block(
              children: [
                new InputFormField(
                    hintText: 'Write the sentence.',
                    maxLines: 3,
                    onSaved: (InputValue value) { _inputSentence = value.text; },
                    ),
                new RaisedButton(
                    child: new Text('Check'),
                    onPressed: _handleSubmitted,
                    ),
              ],
              ),
          ),
    ];

    return views;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Sentence ${widget.sentence.number}'),
            ),
        body: new Block(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            children: _buildView(),
            ),
        );

  }
}