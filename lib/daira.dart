import 'commune.dart';
import 'data/algeria_cites.dart';
import 'data/algeria_postcodes.dart';
import 'langs.dart';
import 'postCode.dart';

class Daira {
  Map<String, dynamic> data;
  Daira({this.data});

  /**
   * Returns list of [Commune] object
   * 
   * this method looks for every commune in this Daira
   * and return the result as list of [Commune]
   */
  List<Commune> getCommunes() {
    return algeria_cites
        .where((element) => (element['daira_name'] == data['daira_name']))
        .map((e) => Commune(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [PostCode] object
   * 
   * this method return every post code data in the daira
   * and return the result as list of [PostCode]
   */
  List<PostCode> getPostCodes() {
    return algeria_postcodes
        .where((element) => ((element['daira_name'] == data['daira_name'])))
        .map((e) => PostCode(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return wilaya name of the daira   
   */
  String getWilayaName(Language lang) {
    if (lang == Language.AR) {
      return data['wilaya_name'];
    } else if (lang == Language.FR) {
      return data['wilaya_name  _ascii'];
      //for additional languages
    } else
      return data['wilaya_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return the name of the daira 
   */
  String getDairaName(Language lang) {
    if (lang == Language.AR) {
      return data['daira_name'];
    } else if (lang == Language.FR) {
      return data['daira_name_ascii'];
      //for additional languages
    } else
      return data['daira_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return commune name of the daira 
   */
  String getCommuneName(Language lang) {
    if (lang == Language.AR) {
      return data['commune_name'];
    } else if (lang == Language.FR) {
      return data['commune_name_ascii'];
      //for additional languages
    } else
      return data['commune_name_ascii'];
  }

  /**
   * Returns [String] object 
   * 
   * this method return the code number of the wilaya 
   */
  String getWilayaCode() {
    return data['wilaya_code'];
  }
}
