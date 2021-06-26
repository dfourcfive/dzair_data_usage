# dzair_data_usage

dzair_data_usage is a dart/flutter package for dealing with algerian cities data such as dairas,communes and more.

## Installation

Run this command:
With Flutter:

```bash
 $ flutter pub add dzair_data_usage
```
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```bash
dependencies:
  dzair_data_usage: 0.0.1
```
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Import it
Now in your Dart code, you can use:
```bash
import 'package:dzair_data_usage/dzair.dart';
import 'package:dzair_data_usage/wilaya.dart';
import 'package:dzair_data_usage/daira.dart';
import 'package:dzair_data_usage/postCode.dart';
import 'package:dzair_data_usage/langs.dart';
```


## Usage

```dart
    
    Dzair dzair= Dzair();
    //get every wilaya in algeria
    List<Wilaya> wilayas= dzair.getWilayat();
    //get every daira in algeria
    List<Daira> dairas= dzair.getWilayat();
    //search for daira in algeria
    //result will apears in french
    List<Daira> result = dzair.searchDairatByName('mosta',Language.FR);

    //print result names
    result.forEach((element) {
      element.getDairaName(Language.FR);
    });


```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.



## License
[MIT](https://choosealicense.com/licenses/mit/)