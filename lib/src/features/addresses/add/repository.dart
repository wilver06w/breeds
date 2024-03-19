
import 'package:network_breeds/app/network/http_client.dart';
import 'package:models_breeds/app/models/data_citys.dart';
import 'package:models_breeds/app/models/data_departament.dart';

class Repository {
  Repository({
    required this.yuGiOhHttpClient,
  });
  final XigoHttpClient yuGiOhHttpClient;

  final departament = '/utils/departamentos';
  final citys = '/utils/municipios';

  Future<DataDepartament> getDepartaments() async {
    final response = await yuGiOhHttpClient.msDio.get(departament);

    return DataDepartament.fromJson(response.data);
  }

  Future<DataCitys> getCitys(int id) async {
    final response = await yuGiOhHttpClient.msDio.get('$citys/$id');

    return DataCitys.fromJson(response.data);
  }
}
