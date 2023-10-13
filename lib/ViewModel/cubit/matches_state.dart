part of 'matches_cubit.dart';

@immutable
abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  List<TheMatches> matches;
  MatchesLoaded(this.matches);
}

class MatchesError extends MatchesState {
  String e;
  MatchesError(this.e);
}
