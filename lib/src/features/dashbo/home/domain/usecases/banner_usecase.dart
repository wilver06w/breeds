import 'package:dartz/dartz.dart';
import 'package:breeds/src/core/network/failures.dart';
import 'package:breeds/src/core/utils/usecases/usecase.dart';
import 'package:breeds/src/features/dashbo/home/domain/repositories/abstract_home_repository.dart';
import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';

class BannerUseCase extends UseCaseNoParams<DataBanner> {
  final AbstractHomeRepository repository;

  BannerUseCase({required this.repository});

  @override
  Future<Either<Failure, DataBanner>> call() async {
    final result = await repository.getBanner();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
