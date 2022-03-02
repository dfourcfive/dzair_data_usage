library dzair;

import 'commune.dart';
import 'data/algeria_postcodes.dart';
import 'langs.dart';
import 'postCode.dart';
import 'wilaya.dart';
import 'daira.dart';
import 'data/algeria_cites.dart';

class Dzair {
  /**
   * Returns List of [Wilaya] object 
   * 
   * this method return every wilaya in the country 
   */
  List<Wilaya?>? getWilayat() {
    return algeria_cites
        .where((element) =>
            (((element['wilaya_name_ascii'] == element['daira_name_ascii']) && (element['daira_name_ascii'] == element['commune_name_ascii']))) ||
            (((element['wilaya_name_ascii'] == 'Alger') &&
                (element['daira_name_ascii'] == "Sidi M'hamed") &&
                (element['commune_name_ascii'] == 'Alger Centre'))))
        .map((e) => Wilaya(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns List of [Daira] object 
   * 
   * this method return every daira in the country 
   */
  List<Daira?>? getDairat() {
    return algeria_cites.where((element) => element['daira_name'] == element['commune_name']).map((e) => Daira(data: e)).toSet().toList();
  }

  /**
   * Returns list of [Diara] object
   * 
   * this method takes two paramateres [diaraName] and [language] (FR or AR)
   * looks for every [Daira]'s name that containts [diaraName] in the country
   * and return the result as list of [Diara]
   */
  List<Daira?>? searchDairatByName(String diaraName, Language language) {
    return algeria_cites
        .where((element) {
          if (language == Language.AR) {
            return ((element['daira_name'] == element['commune_name']) &&
                (element['daira_name'].toString().toLowerCase().contains(diaraName.toLowerCase())));
          } else {
            return ((element['daira_name'] == element['commune_name']) &&
                (element['daira_name_ascii'].toString().toLowerCase().contains(diaraName.toLowerCase())));
          }
        })
        .map((e) => Daira(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [Wilaya] object
   * 
   * this method takes two paramateres [wilayaName] and [language] (FR or AR)
   * looks for every [Wilaya]'s name that containts [wilayaName] in the country
   * and return the result as list of [Wilaya]
   */
  List<Wilaya?>? searchWilayatByName(String wilayaName, Language language) {
    return algeria_cites
        .where((element) {
          if (language == Language.AR) {
            return ((element['daira_name'] == element['wilaya_name']) &&
                (element['daira_name'] == element['wilaya_name']) &&
                (element['wilaya_name'].toString().toLowerCase().contains(wilayaName.toLowerCase())));
          } else {
            return ((element['daira_name'] == element['commune_name']) &&
                (element['daira_name'] == element['wilaya_name']) &&
                (element['wilaya_name_ascii'].toString().toLowerCase().contains(wilayaName.toLowerCase())));
          }
        })
        .map((e) => Wilaya(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [Commune] object
   * 
   * this method takes two paramateres [communeName] and [language] (FR or AR)
   * looks for every [Commune]'s name that containts [communeName] in the country
   * and return the result as list of [Commune]
   */
  List<Commune?>? searchCommuneByName(String communeName, Language language) {
    return algeria_cites
        .where((element) {
          if (language == Language.AR) {
            return ((element['commune_name'].toString().contains(communeName)));
          } else {
            return ((element['commune_name_ascii'].toString().contains(communeName)));
          }
        })
        .map((e) => Commune(data: e))
        .toSet()
        .toList();
  }

  /**
   * Returns list of [PostCode] object
   * 
   * this method return  every post code data in the country
   * and return the result as list of [PostCode]
   */
  List<PostCode?>? getPostCodes() {
    return algeria_postcodes.map((e) => PostCode(data: e)).toSet().toList();
  }
}
