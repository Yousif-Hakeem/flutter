class TheMatches {
  String? firstTeam;
  String? secondTeam;
  int? duration;
  String? location;
  TheMatches() {}
  TheMatches.fromMap(Map<String, dynamic> map) {
    firstTeam = map['first team'];
    secondTeam = map['second team'];
    duration = map['duration'];
    location = map['location'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'first team': firstTeam,
      'second team': secondTeam,
      'duration': duration,
      'location': location,
    };
    return map;
  }
}
