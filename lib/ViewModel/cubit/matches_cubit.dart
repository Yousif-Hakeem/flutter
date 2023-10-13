import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_Database.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MyDb db = MyDb();
  MatchesCubit() : super(MatchesInitial());

  void getMatches() async {
    emit(MatchesLoading());

    try {
      List<TheMatches> matches = await db.getFromDb();
      emit(MatchesLoaded(matches));
    } catch (e) {
      emit(MatchesError('Error Fetching data'));
    }
  }
}
