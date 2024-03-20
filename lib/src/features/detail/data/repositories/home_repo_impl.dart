import 'package:breeds/src/features/detail/data/data_sources/remote/detail_impl_api.dart';
import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:breeds/src/features/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/exceptions.dart';
import 'package:network_breeds/app/network/failures.dart';

class DetailRepositoryImpl extends AbstractDetailRepository {
  final DetailImplApi articlesApi;

  DetailRepositoryImpl({
    required this.articlesApi,
  });

  @override
  Future<Either<Failure, BreedDetail>> getBreeds(idBreed) async {
    try {
      final result = await articlesApi.getBreeds(idBreed);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
