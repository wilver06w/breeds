import 'package:bloc_test/bloc_test.dart';
import 'package:breeds/src/features/splash/ui/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const model = Model();

  late BlocSplash bloc;

  setUp(() {
    bloc = BlocSplash();
  });
  test('should set initial state', () {
    expect(bloc.state, const InitialState(model));
  });

  blocTest<BlocSplash, StateSplash>(
    'emits [LoadedState] when FakeLoadingEvent is Ok.',
    build: () => bloc,
    wait: const Duration(seconds: 5),
    act: (bloc) => bloc.add(FakeLoadingEvent()),
    expect: () => [
      const LoadedState(model),
    ],
  );
}
