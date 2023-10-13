part of 'indicitor_cubit.dart';

final class IndicitorState extends Equatable {
  int index = 0;

  IndicitorState(this.index);

  @override
  List<Object> get props => [index];
}
