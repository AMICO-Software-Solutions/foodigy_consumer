import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeController extends GetxController {
  int groupValue = 0;
  int typeValue = 0;
  int timeValue = 0;
  String? type = '';
  String? time = '';
  String? productTime;
  String? one = '';
  String? second = '';
  String? third = '';
  int valu = 0;
  String deliveryTime = "";

  void timeCalclution(String? productTime) {
    print(productTime);
    valu = (int.parse(productTime.toString().substring(0, productTime.toString().indexOf(':'))) +
        1);
    print(valu);
    one = productTime.toString().substring(2, 5);
    second =
        productTime.toString().substring(productTime.toString().indexOf(':'));
    third = productTime
        .toString()
        .substring(productTime.toString().indexOf(':') + 1, 5);

    print(valu.toString());
    print(one);
    print(second.toString());
    print(third);

    //  int pTIme = int.parse(productTime.toString());
    DateTime date = DateTime(
        2021, 3, 28, 1, 50, 30); // Setting the DateTime to 2021-03-28, 1 AM
    print(date.add(Duration(minutes: 60)));
    DateTime dateTime = DateTime(
        date.year, date.month, date.day + 1, date.hour + 1, date.minute);
    print(dateTime.day);
    var time = "${dateTime.day}, ${dateTime.hour}, ${dateTime.minute}";
    //   print(time);

    print(DateFormat.jm().format(DateFormat("hh:mm:ss")
        .parse("${dateTime.hour}:${dateTime.minute}:${dateTime.microsecond}")));
    print('${valu.toString()}${second.toString()}');
    deliveryTime = '${valu.toString()}${second.toString()}';
    update();
    return null;
  }
}
