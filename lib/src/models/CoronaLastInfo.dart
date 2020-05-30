class CoronaLastInfo {
  final String updated_at;
  final String date;
  final int deaths;
  final int confirmed;
  final int recovered;
  final int active;
  final int new_confirmed;
  final int new_recovered;
  final int new_deaths;
  final bool is_in_progress;

  CoronaLastInfo(
      {this.updated_at,
      this.date,
      this.deaths,
      this.confirmed,
      this.recovered,
      this.active,
      this.new_confirmed,
      this.new_recovered,
      this.new_deaths,
      this.is_in_progress});

  factory CoronaLastInfo.fromJson(Map<String, dynamic> json) {
    return CoronaLastInfo(
      updated_at: json['updated_at'],
      date: json['date'],
      deaths: json['deaths'],
      confirmed: json['confirmed'],
      recovered: json['recovered'],
      active: json['active'],
      new_confirmed: json['new_confirmed'],
      new_recovered: json['new_recovered'],
      new_deaths: json['new_deaths'],
      is_in_progress: json['is_in_progress'],
    );
  }
}
