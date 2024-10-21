import 'package:flutter_lec12/core/failure/failure.dart';

class ColorFailure extends Failure
{
  ColorFailure({required super.code, super.message});

  @override
  String getlocalizedString() {
    return 'Ошибка!';
  }
}