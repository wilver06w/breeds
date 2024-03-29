import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';

abstract class AbstractDetailRepository {
  Future<Either<Failure, BreedDetail>> getBreeds(idBreed);
}
