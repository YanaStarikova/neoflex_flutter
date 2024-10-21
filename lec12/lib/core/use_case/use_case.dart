import 'package:dartz/dartz.dart';
import 'package:flutter_lec12/core/failure/failure.dart';

abstract class UseCase<Type, Params>{
  Future <Either <Failure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type>{
  Future <Either <Failure, Type>> call();
}

