import 'dart:isolate';
import 'dart:math';

import 'package:test/expect.dart';

void main(List<String> arguments) {
  demoPeriodic();
}

Duration _duration = Duration(seconds: 2);
void demoPeriodic() {

  //periodic : Phương thức periodic hỗ trợ cứ mỗi Duration sẽ gửi data đi.
  //listen: Phương thức để nhận data mà periodic đã gửi đi.
  print("init Stream Periodic");
  var stream = Stream<int>.periodic(_duration, (int count) => sentData());
  print("listen Stream Periodic");
  stream.listen(receiveData);
}

int sentData() {
  return Random().nextInt(100);
}

void receiveData(int data) {
  print("receiveData: ${data}");
}
