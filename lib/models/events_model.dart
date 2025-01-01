class EventsModel {
  final int id;
  final String title;
  final String description;
  final String place;
  final String date;
  final String image;
  final bool ready;

  EventsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    required this.image,
    required this.ready,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      place: json['place'] ?? '',
      date: json['date'] ?? '',
      image: json['image'] ?? '',
      ready: json['ready'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'place': place,
      'date': date,
      'image': image,
      'ready': ready,
    };
  }
}