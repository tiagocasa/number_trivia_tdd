import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';

import '../../domain/entities/number_trivia.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getRandomNumberTriviaCached();
  Future<void> cacheNumberTrivia(NumberTrivia triviaToCache);
}
