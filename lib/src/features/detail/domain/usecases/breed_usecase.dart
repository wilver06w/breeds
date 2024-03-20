import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:breeds/src/features/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:utils_breeds/utils/usecases/usecase.dart';

class GetBreedUseCase extends UseCase<BreedDetail, String> {
  final AbstractDetailRepository repository;

  GetBreedUseCase({required this.repository});

  @override
  Future<Either<Failure, BreedDetail>> call(String params) async {
    final result = await repository.getBreeds(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
