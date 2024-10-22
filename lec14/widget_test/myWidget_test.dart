import 'package:flutter_lec14/myWidget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async { //функция для тестирования виджета
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');//ищем тектовые виджеты
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);//проверка с ожидаемым значением
    expect(messageFinder, findsOneWidget);
  });
}