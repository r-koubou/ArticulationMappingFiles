## Expression map - Junk Guitar for KONTAKT

![](logo.jpg)

## ■ 概要

**[Junk Guitar for KONTAKT](http://junk-spider.com/jp/products/junkguitarforkontakt.html)**用のエクスプレッションマップ。

Cubase での Junk Guitar のキースイッチの組み合わせた打ち込み負荷を軽減します。
エクスプレッションマップを使用することで、奏法の切り替えを可視化し
ピアノロールでのキースイッチの切替のためのノートナンバーを気にすることが無くなります。


## ■ 対応バージョン

Expression map 機能をサポートする Cubase のバージョン。
（マニュアルを見る限り、最上位版でのみ使用できます）

* * *

## ■ ファイル構成

奏法パターンの組み合わせが多いため、演奏モード毎にファイルを分けています。

* Mono mode
    * Junk Guitar Mono.expressionmap
* Poly mode
    * Junk Guitar Poly.expressionmap
* Chord mode
    * Junk Guitar Chord.expressionmap

## ■ 使い方

[基本的な操作はSteinberg公式動画(Youtube)を見て下さい。](https://www.youtube.com/watch?v=N1vWHFKr_28)

主に以下の2つを設定し、使い分けていきます。

#### 1.ストロークの設定
明示的に指定することを推奨します。

#### 2.演奏方法の設定
ノート毎に指定することを推奨します。

* * *

## ■ 複数の演奏モードを使い分ける場合

### Rack Instruments (ラック)

1. 演奏モード分の Junk Guitar のパッチをロードして下さい。

以下の例ではモノモード、ポリモード用にロードをし、MIDI ch を 1、2で受けるように設定しています。
![](usage001.jpg)

2. 演奏モード分のMIDIトラックを作成し、出力先をそれぞれのパッチに設定して下さい。

エクスプレッションマップファイルで読み込んだ奏法を各MIDIトラックにアサインします。
![](usage002.jpg)

3. 各MIDIトラックのエクスプレッションマップにそれぞれの
   エクスプレッションマップファイルで読み込んだ奏法をアサインします。


### Track Instruments (インストゥルメントトラック)

エクスプレッションマップファイルで読み込んだ奏法をアサインします。

## ■ 利用条件

[MITライセンス](https://raw.githubusercontent.com/r-koubou/Cubase-Expression-Maps/master/LICENSE) に準拠します

