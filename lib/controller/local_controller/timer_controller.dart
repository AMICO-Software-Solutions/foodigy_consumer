import 'package:get/get.dart';
import 'package:quiver/async.dart';


class TImerController extends GetxController{

  RxInt start = 120.obs;
  RxInt current = 120.obs;

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start.toInt()),
      Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
        current = start - duration.elapsed.inSeconds;
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

    RxInt value = 0.obs;
  var totValu = 0.obs;
  RxInt count = 0.obs;
  Future? add(int? addValue) {
    count.value++;
    value = value + addValue!;
    // totValu.value = 0;
    print(value);
    update();
    return null;
  }
}