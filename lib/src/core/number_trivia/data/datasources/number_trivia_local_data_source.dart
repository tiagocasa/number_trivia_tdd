import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getConcreteNumberTriviaCached(int number);
  Future<NumberTriviaModel> getRandomNumberTriviaCached();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
