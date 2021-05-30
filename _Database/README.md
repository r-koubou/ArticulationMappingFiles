<!-- TOC -->

- [Database management](#database-management)
    - [Tool](#tool)
    - [How to add or update data](#how-to-add-or-update-data)
        - [Spreadsheet.](#spreadsheet)
        - [JSON](#json)
    - [Generating files for the DAW](#generating-files-for-the-daw)

<!-- /TOC -->

# Database management



##  Tool

My own software

https://github.com/r-koubou/KeySwitchManager/releases/latest

The database is [local database](http://www.litedb.org/) (file).



## How to add or update data

The tool provides the following methods.

- Spreadsheet
    - Easy graphical editing
    - Special software such as Excel is required.
    - Table items, vulnerable to specification changes
- JSON
    - Text-based, manageable and editable with your favorite text editor
    - resistant to specification changes
    - It tends to be a lot of lines.

### Spreadsheet.

#### Edit the spreadsheet

1. Copy "Template.xlsm" and rename it to "product name".xlsm
2. move to the folder with the developer's name (if there is no folder, create it)

#### Generates a batch command to pass the spreadsheet file to the DB

```bash
python gen_upsert_xlsm_batch.py -product "Developer Name" "Product Name"
```

The file `upsert.batch.txt` will be generated, and run following command

```bash
KeySwitchManager.CLI batch -f ./upsert.batch.txt
:
:
xxx batch processed in 1234 ms.
```



### JSON

#### Create a JSON file with a command that generates a template file

```bat
KeySwitchManager.CLI template -o template.json
```

The following file will be generated

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

Add and update to the DB

```bash
KeySwitchManager.CLI import -i ./template.json -f KeySwitches.db
:
:
xx record(s) inserted, 0 record(s) updated
```



## Generating files for the DAW



#### Example

### Generating Batch Processing with Scripts

#### Example

Generate a file in the VSTExpressionMap file format under the out folder with the following conditions

- Developer name 8DIO
- All products

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



### Manually generate

Generate a file in the VSTExpressionMap file format under the out folder with the following conditions

- Developer name 8DIO
- All products

```bash
KeySwitchManager.CLI expressionmap -s -d "8DIO" -f KeySwitches.db -o out
```

#### Example

Generate a file in the VSTExpressionMap file format under the out folder with the following conditions

- Developer name 8DIO
- Product Name Majestica

```bash
KeySwitchManager.CLI expressionmap -s -d "8DIO" -p "Majestica"-f KeySwitches.db -o out
```

#### Example

- Generate a key switch file for Studio One under the out folder with the following conditions.

    The other options are the same as above, except that the first command argument is `studio-one`.

    - Developer name 8DIO
    - All products

```bash
KeySwitchManager.CLI studio-one -s -d "8DIO" -f KeySwitches.db -o out
```

