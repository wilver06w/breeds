import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';
import 'package:network_breeds/app/network/exceptions.dart';
import 'package:network_breeds/app/network/http_client.dart';
import 'package:breeds/src/features/detail/data/data_sources/remote/abstract_home_api.dart';

class DetailImplApi extends AbstractDetailApi {
  DetailImplApi({
    required this.xigoHttpClient,
  });
  final XigoHttpClient xigoHttpClient;

  final urlBreeds = '/v1/breeds';

  ///Trae la data de las razas.
  ///
  ///Va al endpoint y trae la lista de razas.
  @override
  Future<BreedDetail> getBreeds(idBreed) async {
    try{
    final response = await xigoHttpClient.msDio.get('$urlBreeds/$idBreed');

    return BreedDetail.fromJson(response.data);
    } on ServerException catch (e) {
      throw ServerException(e.message, e.statusCode);
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
