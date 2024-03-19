import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

abstract class AbstractHomeApi {
  Future<List<int>> getListBan();
  Future<DataBanner> getBanner();
  Future<DataCategoria> getCategorias();
}
