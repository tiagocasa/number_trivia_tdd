import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/src/core/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/src/shared/error/exceptions.dart';
import 'package:number_trivia/src/shared/error/failures.dart';
import 'package:number_trivia/src/shared/services/network_info.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
    int number,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await remoteDataSource.getConcreteNumberTrivia(number);
        await localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia =
            await localDataSource.getConcreteNumberTriviaCached(number);
        return Right(localTrivia);
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
