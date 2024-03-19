import 'package:models_breeds/app/models/clien.dart';

import 'package:network_breeds/app/network/http_client.dart';

class Repository {
  Repository({
    required this.xigoHttpClient,
  });

  final XigoHttpClient xigoHttpClient;

  final register = '/registro';
  final user = '/clientes';

  Future<Clien> getClient() async {
    final response = await xigoHttpClient.msDio.get(user);

    return Clien.fromJson(response.data["data"]);
  }
}
