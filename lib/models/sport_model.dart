class SportModel {
  final String name;
  final String sportName;
  final String icon;
  final String active;

  SportModel({
    required this.name,
    required this.sportName,
    required this.icon,
    required this.active,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    return SportModel(
      name: json['name'] ?? '',
      sportName: json['sport_name'] ?? '',
      icon: json['icon'] ?? '',
      active: json['active'] ?? '0',
    );
  }
}