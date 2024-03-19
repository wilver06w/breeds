import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<int>>> getListBan();
  Future<Either<Failure, DataBanner>> getBanner();
  Future<Either<Failure, DataCategoria>> getCategorias();
}
