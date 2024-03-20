import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';

abstract class AbstractHomeApi {
  Future<List<BreedDetail>> getBreeds();
}
