import 'package:dartz/dartz.dart';
import 'package:network_breeds/app/network/failures.dart';
import 'package:breeds/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:models_breeds/app/models/data_categoria.dart';
import 'package:utils_breeds/utils/usecases/usecase.dart';

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
