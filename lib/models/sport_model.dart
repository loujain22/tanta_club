class SportModel {
  final String name;
  final String sportName;
  final String icon;
  final int active;
  final String owner;
  final String creation;
  final String modified;
  final String modifiedBy;
  final int docstatus;
  final int idx;
  final String image;
  final String title;
  final String description;

  SportModel({
    required this.name,
    required this.sportName,
    required this.icon,
    required this.active,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.image,
    required this.title,
    required this.description,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    return SportModel(
      name: json['name'] ?? '',
      sportName: json['sport_name'] ?? '',
      icon: json['icon'] ?? '',
      active: json['active'] ?? 0,
      owner: json['owner'] ?? '',
      creation: json['creation'] ?? '',
      modified: json['modified'] ?? '',
      modifiedBy: json['modified_by'] ?? '',
      docstatus: json['docstatus'] ?? 0,
      idx: json['idx'] ?? 0,
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  bool get isActive => active == 1;
}