import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocDashboard extends Bloc<DashboardEvent, DashboardState> {
  BlocDashboard() : super(const InitialState(Model())) {
    on<ChangePositionEvent>(_onChangePositionEvent);
  }

  Future<void> _onChangePositionEvent(
    ChangePositionEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(
      ChangedPositionState(
        state.model.copyWith(
          position: event.position,
        ),
      ),
    );
  }
}
