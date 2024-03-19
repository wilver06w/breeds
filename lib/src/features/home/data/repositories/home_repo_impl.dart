import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/exceptions.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:breeds/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

class HomeRepositoryImpl extends AbstractHomeRepository {
  final HomeImplApi articlesApi;

  HomeRepositoryImpl({
    required this.articlesApi,
  });

  @override
  Future<Either<Failure, List<Breed>>> getBreeds() async {
    try {
      final result = await articlesApi.getBanner();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
