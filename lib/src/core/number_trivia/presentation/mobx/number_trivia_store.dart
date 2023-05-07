import 'package:mobx/mobx.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/src/shared/error/failures.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';

part 'number_trivia_store.g.dart';

class NumberTriviaStore = NumberTriviaStoreBase with _$NumberTriviaStore;

abstract class NumberTriviaStoreBase with Store {
  final GetConcreteNumberTrivia concrete;
  final GetRandomNumberTrivia random;
  final InputConverter converter;
  NumberTriviaStoreBase(this.concrete, this.random, this.converter);

  @observable
  late String numberString;

  @observable
  late String triviaText;

  @observable
  late int triviaNumber;

  @observable
  late bool isLoading;

  @action
  Future<void> getConcreteNumberTrivia(String numberString) async {
    isLoading = true;
    final numberConverted = converter.stringtoUnisgnedInteger(numberString);
    await numberConverted.fold(
      (l) {
        triviaNumber = 0;
        triviaText = failureToMessage(l);
        return;
      },
      (r) async {
        final failureOrTrivia = await concrete(Params(number: r));
        failureOrTrivia.fold((l) {
          triviaText = failureToMessage(l);
          return;
        }, (r) {
          triviaText = r.text;
          triviaNumber = r.number;
        });
      },
    );
  }

  String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
