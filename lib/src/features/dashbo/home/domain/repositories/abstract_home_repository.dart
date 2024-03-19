import 'package:dartz/dartz.dart';
import 'package:breeds/src/core/network/failures.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:breeds/src/shared/models/data_categoria.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<int>>> getListBan();
  Future<Either<Failure, DataBanner>> getBanner();
  Future<Either<Failure, DataCategoria>> getCategorias();
}
