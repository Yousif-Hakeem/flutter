import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'indicitor_state.dart';

class IndicitorCubit extends Cubit<IndicitorState> {
  IndicitorCubit() : super(IndicitorState(0));

  void setIndex(int number) {
    emit(IndicitorState(number));
  }
}
