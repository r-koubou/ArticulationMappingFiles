<!-- TOC -->

- [データベース管理](#データベース管理)
    - [使用ツール](#使用ツール)
    - [データの追加、更新方法](#データの追加更新方法)
        - [スプレッドシート](#スプレッドシート)
        - [JSON](#json)
    - [DAW 用のファイルを生成する](#daw-用のファイルを生成する)

<!-- /TOC -->

# データベース管理



##  使用ツール

自作ツール

https://github.com/r-koubou/KeySwitchManager/releases/latest

データベースは[ローカルデータベース](http://www.litedb.org/)（ファイル）である。



## データの追加、更新方法

ツールにて以下の方法を提供する。

- スプレッドシート
    - グラフィカルな編集が容易
    - Excelなど専用のソフトウェアが必要
    - 表の項目、仕様変更に弱い
- JSON
    - テキストベースで管理可能で好きなテキストエディタで編集可能
    - 仕様変更に強い
    - 行数が多くなりがち



### スプレッドシート

#### スプレッドシートを編集

1. Template.xlsmをコピーし、製品名.xlsmにリネーム
2. デベロッパー名のフォルダに移動（フォルダがない場合は作成）

#### スプレッドシートファイルをDBに渡すためのバッチコマンドを生成する

```bash
python gen_upsert_xlsm_batch.py -product "デベロッパー名" "製品名"
```

`upsert.batch.txt` というファイルが生成されるのでその後以下のコマンドを実行する。

```bash
KeySwitchManager.CLI batch -f ./upsert.batch.txt
:
:
xxx batch processed in 1234 ms.
```



### JSON

#### 雛形となるファイルを生成するコマンドでJSONファイルを作成

```bat
KeySwitchManager.CLI template -o template.json
```

以下の様なファイルが生成される。

```json
[
  {
    "id": "dea127c4-35db-4198-b033-8e1fae0cc69e",
    "author": "Author",
    "description": "Description",
    "created": "2020-10-07T05:21:05.371Z",
    "last_updated": "2020-10-07T05:21:05.382Z",
    "developer_name": "Developer Name",
    "product_name": "Product name",
    "instrument_name": "Instrument name",
    "articulations": [
      {
        "name": "name",
        "midi_message": {
          "note_on": [
            {
              "status": 144,
              "channel": 0,
              "data1": 0,
              "data2": 100
            }
          ],
          "control_change": [
            {
              "status": 176,
              "channel": 0,
              "data1": 1,
              "data2": 100
            }
          ],
          "program_change": [
            {
              "status": 192,
              "channel": 2,
              "data1": 34,
              "data2": 0
            }
          ]
        },
        "extra": {
          "extra1 key": "extra1 value",
          "extra2 key": "extra2 value"
        }
      }
    ],
    "extra": {
      "extra1 key": "extra1 value",
      "extra2 key": "extra2 value"
    }
  }
]
```

DBへ追加・更新する

```bash
KeySwitchManager.CLI import -i ./template.json -f KeySwitches.db
:
:
xx record(s) inserted, 0 record(s) updated
```



## DAW 用のファイルを生成する

### スクリプトでバッチ処理を生成する

#### 例

以下の条件でVSTExpressionMap ファイル形式のファイルを _out フォルダ以下に生成する

- デベロッパー名 8DIO
- 製品全て

```bash
# bash
python gen_export_batch.py -developer "8DIO"
./export.sh
```

```dos
rem cmd
python gen_export_batch.py -developer "8DIO"
export.bat
```



### 手動で生成する

#### 例

以下の条件でVSTExpressionMap ファイル形式のファイルを _out フォルダ以下に生成する

- デベロッパー名 8DIO
- 製品全て

```bash
KeySwitchManager.CLI expressionmap -s -d "8DIO" -f KeySwitches.db -o out
```

#### 例

以下の条件でVSTExpressionMap ファイル形式のファイルを out フォルダ以下に生成する

- デベロッパー名 8DIO
- 製品名 Majestica

```bash
KeySwitchManager.CLI expressionmap -s -d "8DIO" -p "Majestica"-f KeySwitches.db -o out
```

#### 例

以下の条件で Studio One 用のキースイッチファイルを out フォルダ以下に生成する。

コマンド引数の１番目を studio-one にしただけで、その他のオプションは前述と同じ。

- デベロッパー名 8DIO
- 製品全て

```bash
KeySwitchManager.CLI studio-one -s -d "8DIO" -f KeySwitches.db -o out
```

