import 'package:dartz/dartz.dart';
import 'package:breeds/src/core/network/exceptions.dart';
import 'package:breeds/src/core/network/failures.dart';
import 'package:breeds/src/features/dashbo/home/data/data_sources/remote/home_impl_api.dart';
import 'package:breeds/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:breeds/src/shared/models/data_categoria.dart';

class HomeRepositoryImpl extends AbstractHomeRepository {
  final HomeImplApi articlesApi;

  HomeRepositoryImpl({
    required this.articlesApi,
  });

  @override
  Future<Either<Failure, List<int>>> getListBan() async {
    try {
      final result = await articlesApi.getListBan();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, DataBanner>> getBanner() async {
    try {
      final result = await articlesApi.getBanner();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, DataCategoria>> getCategorias() async {
    try {
      final result = await articlesApi.getCategorias();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
