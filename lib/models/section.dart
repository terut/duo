import 'dart:async';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'sentence.dart';

class Section {
  const Section({this.number, this.sentences});
  final String number;
  final List<Sentence> sentences;
}

class SectionBuilder {
  // number of sentence per section
  final numberOfSentence = [
    9,  12, 14, 10, 17, 13, 16, 9,  13, 12,
    11, 9,  10, 10, 11, 9,  12, 14, 12, 17,
    15, 17, 9,  12, 10, 10, 15, 13, 12, 12,
    17, 10, 11, 15, 14, 16, 8,  9,  11, 15,
    15, 11, 13, 17, 13
  ];
  var sections = [];

  Future<List<Section>> build() async {
    if(sections.isEmpty) {
      final csvStr = await rootBundle.loadString('assets/csv/all.csv');
      final csv = await new CsvToListConverter().convert(csvStr, eol: "\n");
      var index = 1;
      var start = 0;
      numberOfSentence.forEach((i) {
        var subCsv = csv.sublist(start, start + i);
        var sentences = [];
        subCsv.forEach((List<String> list) {
          sentences.add(new Sentence(number: list[0].toString(), en: list[1], jp: list[2]));
        });
        var section = new Section(number: (index).toString(), sentences: sentences);
        sections.add(section);
        start += i;
        index++;
      });
    }
    return sections;
  }
}