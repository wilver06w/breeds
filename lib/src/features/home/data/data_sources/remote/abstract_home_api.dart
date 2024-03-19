import 'package:breeds/src/features/home/domain/models/breed.dart';
import 'package:models_breeds/app/models/data_categoria.dart';

abstract class AbstractHomeApi {
  Future<Breed> getBanner();
}
