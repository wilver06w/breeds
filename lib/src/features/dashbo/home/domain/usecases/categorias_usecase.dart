import 'package:dartz/dartz.dart';
import 'package:breeds/src/core/network/failures.dart';
import 'package:breeds/src/core/utils/usecases/usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';
import 'package:breeds/src/shared/models/data_categoria.dart';

class CategoriesUseCase extends UseCaseNoParams<DataCategoria> {
  final AbstractHomeRepository repository;

  CategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, DataCategoria>> call() async {
    final result = await repository.getCategorias();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
