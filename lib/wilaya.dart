import 'commune.dart';
import 'daira.dart';
import 'data/algeria_postcodes.dart';
import 'langs.dart';
import 'postCode.dart';
import 'data/algeria_cites.dart';

class Wilaya {
  Map<String, dynamic> data;
  Wilaya({this.data});

  /**
   * Returns list of [Daira] object
   * 
   * this method looks for every daira in this wilaya
   * and return the result as list of [Daira]
   */
  List<Daira> getDairas() {
    return algeria_cites
        .where((element) =>
            (element['wilaya_name_ascii'] == data['wilaya_name_ascii']) &&
            (element['daira_name'] == element['commune_name']))
        .map((e) => Daira(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [Commune] object
   * 
   * this method looks for every commune in this wilaya
   * and return the result as list of [Commune]
   */
  List<Commune> getCommunes() {
    return algeria_cites
        .where((element) =>
            (element['wilaya_name_ascii'] == data['wilaya_name_ascii']))
        .map((e) => Commune(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [PostCode] object
   * 
   * this method looks for every post code data in this wilaya
   * and return the result as list of [PostCode]
   */
  List<PostCode> getPostCodes() {
    return algeria_postcodes
        .where((element) => ((element['wilaya_name'] == data['wilaya_name']) &&
            (element['wilaya_name'] == data['daira_name']) &&
            (element['wilaya_name'] == data['commune_name'])))
        .map((e) => PostCode(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [Diara] object
   * 
   * this method takes two paramateres [diaraName] and [language] (FR or AR)
   * looks for every [Daira]'s name that containts [diaraName] in this [Wilaya]
   * and return the result as list of [Diara]
   */
  List<Daira> searchDairatByName(String diaraName, Language language) {
    return algeria_cites
        .where((element) {
          if (language == Language.AR) {
            return (((element['wilaya_name'] == data['wilaya_name'])) &&
                (element['daira_name'] == element['commune_name']) &&
                (element['daira_name'].toString().contains(diaraName)));
          } else {
            return ((element['wilaya_name'] == data['wilaya_name']) &&
                (element['daira_name'] == element['commune_name']) &&
                (element['daira_name_ascii'].toString().contains(diaraName)));
          }
        })
        .map((e) => Daira(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [Commune] object
   * 
   * this method takes two paramateres [communeName] and [language] (FR or AR)
   * looks for every [Commune]'s name that containts [communeName] in this [Wilaya]
   * and return the result as list of [Commune]
   */
  List<Commune> searchCommuneByName(String communeName, Language language) {
    return algeria_cites
        .where((element) {
          if (language == Language.AR) {
            return ((element['wilaya_name'] == data['wilaya_name']) &&
                (element['commune_name'].toString().contains(communeName)));
          } else {
            return ((element['wilaya_name'] == data['wilaya_name']) &&
                (element['commune_name_ascii']
                    .toString()
                    .contains(communeName)));
          }
        })
        .map((e) => Commune(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns [String] object 
   * 
   * this method take [language] (FR or AR) as parameter
   * and return the name of the wilaya 
   */
  String getWilayaName(Language lang) {
    if (lang == Language.AR) {
      return data['wilaya_name'];
    } else if (lang == Language.FR) {
      if (data.containsKey('wilaya_name_ascii')) {
        return data['wilaya_name_ascii'];
      }
      return "not available";
      //for additional languages
    } else
      return data['wilaya_name_ascii'];
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
