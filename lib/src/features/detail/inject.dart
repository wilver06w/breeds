import 'package:breeds/src/features/detail/data/data_sources/remote/detail_impl_api.dart';
import 'package:breeds/src/features/detail/data/repositories/home_repo_impl.dart';
import 'package:breeds/src/features/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:breeds/src/features/detail/domain/usecases/breed_usecase.dart';
import 'package:network_breeds/app/network/http_client.dart';

class InjectDetailUseCase {
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => DetailImplApi(
        xigoHttpClient: i<XigoHttpClient>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => DetailRepositoryImpl(
        articlesApi: i<DetailImplApi>(),
      ),
    ),
    Bind.lazySingleton((i) => AbstractDetailRepository),
    Bind.lazySingleton(
        (i) => GetBreedUseCase(repository: i<AbstractDetailRepository>())),
  ];
}
