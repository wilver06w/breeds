import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';
import 'package:utils_breeds/utils/usecases/usecase.dart';

class ListBanUseCase extends UseCaseNoParams<List<int>> {
  final AbstractHomeRepository repository;

  ListBanUseCase({required this.repository});

  @override
  Future<Either<Failure, List<int>>> call() async {
    final result = await repository.getListBan();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
