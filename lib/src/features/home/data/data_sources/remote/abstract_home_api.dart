import 'package:models_breeds/app/models/breed.dart';

abstract class AbstractHomeApi {
  Future<List<Breed>> getBreeds();
}
