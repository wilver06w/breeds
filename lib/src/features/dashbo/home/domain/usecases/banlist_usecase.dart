import 'package:dartz/dartz.dart';
import 'package:breeds/src/core/network/failures.dart';
import 'package:breeds/src/core/utils/usecases/usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';

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
