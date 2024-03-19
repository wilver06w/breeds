import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';

part 'event.dart';
part 'state.dart';

class BlocPaymentAdd extends Bloc<PaymentAddEvent, PaymentAddState> {
  BlocPaymentAdd() : super(const InitialState(Model())) {
    on<OnChangeNumberCardEvent>(_onChangeNumberCardEvent);
    on<OnChangeHolderNameEvent>(_onChangeHolderNameEvent);
    on<OnChangemMaaEvent>(_onChangemMaaEvent);
    on<OnChangecVVEvent>(_onChangecVVEvent);
  }

  Future<void> _onChangeNumberCardEvent(
    OnChangeNumberCardEvent event,
    Emitter<PaymentAddState> emit,
  ) async {
    emit(
      ChangedNumberCardState(
        state.model.copyWith(
          numberCard: event.number,
        ),
      ),
    );
  }

  Future<void> _onChangeHolderNameEvent(
    OnChangeHolderNameEvent event,
    Emitter<PaymentAddState> emit,
  ) async {
    emit(
      ChangedNameCardState(
        state.model.copyWith(
          name: event.name,
        ),
      ),
    );
  }

  Future<void> _onChangemMaaEvent(
    OnChangemMaaEvent event,
    Emitter<PaymentAddState> emit,
  ) async {
    emit(
      ChangedmMmAACardState(
        state.model.copyWith(
          mmAA: event.mmAA,
        ),
      ),
    );
  }

  Future<void> _onChangecVVEvent(
    OnChangecVVEvent event,
    Emitter<PaymentAddState> emit,
  ) async {
    emit(
      ChangedmMmAACardState(
        state.model.copyWith(
          cVV: event.cVV,
        ),
      ),
    );
  }
}
