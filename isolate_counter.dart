import 'dart:isolate';

Isolate? test;
void main() async {
  print('Started process');
  final receivePort = ReceivePort();

  Isolate? test = await Isolate.spawn(heavyComputation, receivePort.sendPort);

  receivePort.listen((message) {
    print(message);
    receivePort.close();
  });

  test.kill();

  print('Process end');
}

void heavyComputation(SendPort sendPort) {
  int sum = 1;
  for (var i = 1; i < 100000; i++) {
    sum = i * (i + 1);
  }

  sendPort.send(sum);
}
