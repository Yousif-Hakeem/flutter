class TheMatches {
  String? firstTeam;
  String? secondTeam;
  int? duration;
  String? location;
  TheMatches() {}
  TheMatches.fromMap(Map<String, dynamic> map) {
    firstTeam = map['firstTeam'];
    secondTeam = map['secondTeam'];
    duration = map['duration'];
    location = map['location'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'firstTeam': firstTeam,
      'secondTeam': secondTeam,
      'duration': duration,
      'location': location,
    };
    return map;
  }
}
