import 'package:breeds/src/features/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:models_breeds/app/models/breed.dart';
import 'package:network_breeds/app/network/exceptions.dart';
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
  Future<List<Breed>> getBreeds() async {
    try {
      final response = await xigoHttpClient.msDio.get(urlBreeds);

      List<dynamic> list = response.data;

      final rawListData = list.map((e) => Breed.fromJson(e)).toList();
      return rawListData;
    } on ServerException catch (e) {
      throw ServerException(e.message, e.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
