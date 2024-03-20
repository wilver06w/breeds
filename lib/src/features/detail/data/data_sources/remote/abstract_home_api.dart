import 'package:breeds/src/features/detail/domain/models/breed_detail.dart';

abstract class AbstractDetailApi {
  Future<BreedDetail> getBreeds(idBreeds);
}
