import 'package:bloc_test/bloc_test.dart';
import 'package:breeds/src/features/detail/domain/models/breed_detail.dart'
    as bd;
import 'package:breeds/src/features/detail/domain/usecases/breed_usecase.dart';
import 'package:breeds/src/features/detail/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_breeds/app/network/failures.dart';

class MockGetBreedUseCase extends Mock implements GetBreedUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final breedDetail = bd.BreedDetail(
    id: 'Bull',
    rare: 3,
    rex: 3,
    suppressedTail: 4,
    shortLegs: 3,
    hypoallergenic: 3,
    name: 'Bull Terrier',
    lifeSpan: '10 - 12 years',
    origin: 'England',
    weight: bd.Weight(
      metric: '5-7',
      imperial: '11-15',
    ),
    temperament: 'Extoverti',
    countryCode: 'es_co',
    countryCodes: 'co',
    description: 'description',
    indoor: 0,
    adaptability: 5,
    affectionLevel: 4,
    childFriendly: 4,
    dogFriendly: 3,
    energyLevel: 5,
    grooming: 4,
    healthIssues: 4,
    intelligence: 4,
    sheddingLevel: 4,
    socialNeeds: 4,
    strangerFriendly: 4,
    vocalisation: 4,
    experimental: 0,
    hairless: 0,
    natural: 0,
  );

  const model = Model();

  late BlocDetail bloc;
  final mockGetBreedUseCase = MockGetBreedUseCase();

  setUp(() {
    bloc = BlocDetail(
      getBreedUseCase: mockGetBreedUseCase,
    );
  });
  test('should set initial state', () {
    expect(bloc.state, const InitialState(model));
  });

  blocTest<BlocDetail, DetailState>(
    'emits [LoadingBreedState, LoadedBreedState] when LoadBreedDetailEvent is LoadedSuccess.',
    build: () {
      when(
        () => mockGetBreedUseCase.call('Bull'),
      ).thenAnswer(
        (_) async => Right(breedDetail),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const LoadBreedDetailEvent(idBreeds: 'Bull')),
    expect: () => [
      const LoadingBreedState(model),
      LoadedBreedState(
        model.copyWith(
          breedDetail: breedDetail,
        ),
      ),
    ],
  );

  blocTest<BlocDetail, DetailState>(
    'emits [LoadingBreedState, ErrorBreedState] when LoadBreedDetailEvent is Error.',
    build: () {
      when(
        () => mockGetBreedUseCase.call('Bull'),
      ).thenAnswer(
        (_) async => const Left(
          ServerFailure('Fallo', 400),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const LoadBreedDetailEvent(idBreeds: 'Bull')),
    expect: () => [
      const LoadingBreedState(model),
      const ErrorBreedState(
        model: model,
        message: 'Fallo',
      ),
    ],
  );
}
