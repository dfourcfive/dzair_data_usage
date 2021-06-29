import 'data/algeria_postcodes.dart';
import 'langs.dart';
import 'postCode.dart';

class Commune {
  Map<String, dynamic>? data;
  Commune({this.data});

  /**
   * Returns list of [PostCode] object
   * 
   * this method return every post code data in the commune
   * and return the result as list of [PostCode]
   */
  List<PostCode> getPostCodes() {
    return algeria_postcodes
        .where((element) => element['commune_name'] == data!['commune_name'])
        .map((e) => PostCode(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return wilaya name of the commune   
   */
  String? getWilayaName(Language lang) {
    if (lang == Language.AR) {
      return data!['wilaya_name'];
    } else if (lang == Language.FR) {
      return data!['wilaya_name_ascii'];
      //for additional languages
    } else
      return data!['wilaya_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return daira name of the commune   
   */
  String? getDairaName(Language lang) {
    if (lang == Language.AR) {
      return data!['daira_name'];
    } else if (lang == Language.FR) {
      return data!['daira_name_ascii'];
      //for additional languages
    } else
      return data!['daira_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return the name of the commune   
   */
  String? getCommuneName(Language lang) {
    if (lang == Language.AR) {
      return data!['commune_name'];
    } else if (lang == Language.FR) {
      return data!['commune_name_ascii'];
      //for additional languages
    } else
      return data!['commune_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method return the code number of the wilaya 
   */
  String? getWilayaCode() {
    return data!['wilaya_code'];
  }
}
