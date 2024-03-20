import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:models_breeds/app/models/breed.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<Breed>>> getBreeds();
}
