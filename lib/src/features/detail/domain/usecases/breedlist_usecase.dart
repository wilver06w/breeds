import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:breeds/src/features/detail/domain/repositories/abstract_home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:utils_breeds/utils/usecases/usecase.dart';

class BreedUseCase extends UseCaseNoParams<List<BreedDetail>> {
  final AbstractHomeRepository repository;

  BreedUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BreedDetail>>> call() async {
    final result = await repository.getBreeds();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
