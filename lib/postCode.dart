class PostCode {
  late Map<String, String> data;
  PostCode({data});

  /**
   * return [String] object
   * this method returns the post code 
   */
  String? getPostCode() {
    return data['post_code'];
  }

/**
   * return [String] object
   * this method returns the code name
   */
  String? getPostName() {
    return data['post_name'];
  }

  /**
   * return [String] object
   * this method returns the code address
   */
  String? getPostAddress() {
    return data['post_address'];
  }

  /**
   * return [String] object
   * this method returns the commune name 
   */
  String? getCommuneName() {
    return data['commune_name'];
  }

  /**
   * return [String] object
   * this method returns the daira name
   */
  String? getDairaName() {
    return data['diara_name'];
  }

  /**
   * return [String] object
   * this method returns the wilaya name
   */
  String? getWilayaName() {
    return data['wilaya_name'];
  }

  /**
   * return [String] object
   * this method returns the wilaya code
   */
  String? getWilayaCode() {
    return data['wilaya_code'];
  }
}
