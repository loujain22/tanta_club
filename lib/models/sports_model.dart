class SportsModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double fees;
  final bool isActive;
  final List<String> schedule;
  final String location;
  final String coach;

  SportsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.fees,
    required this.isActive,
    required this.schedule,
    required this.location,
    required this.coach,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) {
    return SportsModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      fees: (json['fees'] ?? 0.0).toDouble(),
      isActive: json['is_active'] ?? false,
      schedule: (json['schedule'] as List?)?.map((e) => e.toString()).toList() ?? [],
      location: json['location'] ?? '',
      coach: json['coach'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'fees': fees,
      'is_active': isActive,
      'schedule': schedule,
      'location': location,
      'coach': coach,
    };
  }

  SportsModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? fees,
    bool? isActive,
    List<String>? schedule,
    String? location,
    String? coach,
  }) {
    return SportsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      fees: fees ?? this.fees,
      isActive: isActive ?? this.isActive,
      schedule: schedule ?? this.schedule,
      location: location ?? this.location,
      coach: coach ?? this.coach,
    );
  }
}
