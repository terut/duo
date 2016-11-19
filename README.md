# duo

The mobile app for studying English for Japanese.

## Getting Started

日本人向けのアプリなので、日本語で書く。
ただし、自分で使うように作ったアプリなので、適当な事はお見知り置きを願いたい。

最初に[セットアップ](https://flutter.io/setup/)を済ませる。

```sh
$ git clone git@github.com:terut/duo.git
$ cd duo

# CSVの形式は以下のような感じ。
# [センテンス番号],[英語のセンテンス],[日本語のセンテンス]
#
$ cp $YOUR_DIR/all.csv assets/csv/all.csv
```

続いてIntelliJを開く。
新しく開いた場合は、[Create New Project]をクリックし、もし開いてる場合は、メニューから[File] -> [New] -> [Project]をクリックする。

[Flutter] -> [Next]を選択し、Project locationの設定からduoをcloneした場所を探し、duoディレクトリを選択して[OK] -> [Finish]を押す。
duo.imiを上書きするか聞かれたら[Yes]で良い。

この手順でプロジェクトを開かないとlibディレクトリが見えないといった現象にぶち当たるので、この通りやるのが良い。おそらくFlutterのプロジェクトとして開かれることが大事なのかもしれない。

pubspec.yamlを開き、右上の[Get dependencies]をクリックして、必要なDartライブラリをインストールする。
そうすると、duo.imlの差分が解消する。

あとは実行可能なので、エミュレータで実行して動作確認ができる。
実機をつないで実行すればインストール完了となる。

## Development

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).


## LICENSE

MIT
