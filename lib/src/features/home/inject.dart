import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:breeds/src/features/home/data/repositories/home_repo_impl.dart';
import 'package:breeds/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:breeds/src/features/home/domain/usecases/banlist_usecase.dart';
import 'package:breeds/src/features/home/domain/usecases/banner_usecase.dart';
import 'package:breeds/src/features/home/domain/usecases/categorias_usecase.dart';

class InjectHomeUseCase {
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeImplApi(
        xigoHttpClient: i<XigoHttpClient>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => HomeRepositoryImpl(
        articlesApi: i<HomeImplApi>(),
      ),
    ),
    Bind.lazySingleton((i) => AbstractHomeRepository),
    Bind.lazySingleton(
        (i) => ListBanUseCase(repository: i<AbstractHomeRepository>())),
    Bind.lazySingleton(
        (i) => BannerUseCase(repository: i<AbstractHomeRepository>())),
    Bind.lazySingleton(
        (i) => CategoriesUseCase(repository: i<AbstractHomeRepository>())),
  ];
}
