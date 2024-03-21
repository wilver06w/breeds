import 'package:bloc_test/bloc_test.dart';
import 'package:breeds/src/features/home/domain/usecases/breedlist_usecase.dart';
import 'package:breeds/src/features/home/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models_breeds/app/models/breed.dart';
import 'package:network_breeds/app/network/failures.dart';

class MockListBreedUseCase extends Mock implements ListBreedUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final breedItemOne = Breed(
    id: 'Bull',
    rare: 3,
    rex: 3,
    suppressedTail: 4,
    shortLegs: 3,
    hypoallergenic: 3,
    name: 'Bull Terrier',
    lifeSpan: '10 - 12 years',
    origin: 'England',
    weight: Weight(
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

  final breedItemTwo = Breed(
    id: 'BullTerri',
    rare: 3,
    rex: 3,
    suppressedTail: 4,
    shortLegs: 3,
    hypoallergenic: 3,
    name: 'Bulla',
    lifeSpan: '10 - 12 years',
    origin: 'EnglandA',
    weight: Weight(
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

  final listBreeds = [
    breedItemOne,
    breedItemTwo,
  ];

  const model = Model(
    listBreed: [],
    breedSearch: '',
  );

  late BlocHome bloc;
  final mockListBreedUseCase = MockListBreedUseCase();

  setUp(() {
    bloc = BlocHome(
      listBreedUseCase: mockListBreedUseCase,
    );
  });
  test('should set initial state', () {
    expect(bloc.state, const InitialState(model));
  });

  blocTest<BlocHome, HomeState>(
    'emits [LoadingListBreedState, LoadedListBreedState] when LoadListBreedEvent is LoadedSuccess.',
    build: () {
      when(
        () => mockListBreedUseCase.call(),
      ).thenAnswer(
        (_) async => Right(listBreeds),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(LoadListBreedEvent()),
    expect: () => [
      const LoadingListBreedState(model),
      LoadedListBreedState(
        model.copyWith(
          listBreed: listBreeds,
        ),
      ),
    ],
  );

  blocTest<BlocHome, HomeState>(
    'emits [LoadingListBreedState, ErrorListBreedState] when LoadListBreedEvent is Error.',
    build: () {
      when(
        () => mockListBreedUseCase.call(),
      ).thenAnswer(
        (_) async => const Left(
          ServerFailure('Fallo', 400),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(LoadListBreedEvent()),
    expect: () => [
      const LoadingListBreedState(model),
      const ErrorListBreedState(
        model: model,
        message: 'Fallo',
      ),
    ],
  );
}
