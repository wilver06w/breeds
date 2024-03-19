import 'package:breeds/src/shared/models/data_citys.dart';
import 'package:breeds/src/shared/models/data_departament.dart';
import 'package:breeds/src/core/network/http_client.dart';

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
