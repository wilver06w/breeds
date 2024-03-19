import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<int>>> getListBan();
  Future<Either<Failure, List<Breed>>> getBreeds();
  Future<Either<Failure, DataCategoria>> getCategorias();
}
