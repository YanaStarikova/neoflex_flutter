import 'package:flutter_lec14/counter.dart'; //подключаем пакет с тестом и классом Counter
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}