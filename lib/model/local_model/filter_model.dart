
class HealthTagModel {
  String title;
  bool value;

  HealthTagModel({required this.title, this.value = false});
}

class CusinesListModel {
  String title;
  bool value;

  CusinesListModel({required this.title, this.value = false});
}

class ProductTimingModel {
  String title;
  bool value;

  ProductTimingModel({required this.title, this.value = false});
}


class CustomizeModel {
  String title;
  bool value;

  CustomizeModel({required this.title, this.value = false});
}
class CustomizeModelAlter {
String? id;
  String title;
  bool value;

  CustomizeModelAlter( {this.id,required this.title, this.value = false});
}

