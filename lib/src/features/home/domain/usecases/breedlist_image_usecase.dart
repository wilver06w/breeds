import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:utils_breeds/utils/usecases/usecase.dart';

class ListBreedUseCase extends UseCaseNoParams<List<Breed>> {
  final AbstractHomeRepository repository;

  ListBreedUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Breed>>> call() async {
    final result = await repository.getBreeds();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
