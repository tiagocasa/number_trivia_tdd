import 'package:dartz/dartz.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/src/shared/error/failures.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
