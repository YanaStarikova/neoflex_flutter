import 'package:dartz/dartz.dart';
import 'package:flutter_lec12/core/use_case/use_case.dart';
import 'package:flutter_lec12/feature/color/domain/entity/color_entity.dart';
import 'package:flutter_lec12/feature/color/domain/entity/color_failure.dart';
import 'package:flutter_lec12/feature/color/domain/repository/color_repository.dart';

class GetColorUseCase implements UseCaseNoParams <ColorEntity>{

  final ColorRepository colorRepository;

  GetColorUseCase({required this.colorRepository});
  

  @override
  Future<Either<ColorFailure, ColorEntity>> call(){
    return colorRepository.read();
  }
}