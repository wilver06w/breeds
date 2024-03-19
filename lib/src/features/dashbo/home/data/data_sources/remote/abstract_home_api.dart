import 'package:breeds/src/features/dashbo/home/domain/models/data_banner.dart';
import 'package:breeds/src/shared/models/data_categoria.dart';

abstract class AbstractHomeApi {
  Future<List<int>> getListBan();
  Future<DataBanner> getBanner();
  Future<DataCategoria> getCategorias();
}
