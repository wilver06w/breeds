import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:breeds/src/features/detail/data/data_sources/remote/abstract_home_api.dart';
import 'package:network_breeds/app/network/http_client.dart';

class HomeImplApi extends AbstractHomeApi {
  HomeImplApi({
    required this.xigoHttpClient,
  });
  final XigoHttpClient xigoHttpClient;

  final urlBreeds = '/v1/breeds';

  ///Trae la data de las razas.
  ///
  ///Va al endpoint y trae la lista de razas.
  @override
  Future<List<BreedDetail>> getBreeds() async {
    final response = await xigoHttpClient.msDio.get(urlBreeds);

    List<dynamic> list = response.data;

    final rawListData = list.map((e) => BreedDetail.fromJson(e)).toList();
    return rawListData;
  }
}
