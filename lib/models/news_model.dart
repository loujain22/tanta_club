class NewsModel {
  final String name;
  final String owner;
  final String creation;
  final String modified;
  final String modifiedBy;
  final int docstatus;
  final int idx;
  final String subject;
  final int ready;
  final String description;
  final String eventImage;
  final String dataTime;

  NewsModel({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.subject,
    required this.ready,
    required this.description,
    required this.eventImage,
    required this.dataTime,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      name: json['name'] ?? '',
      owner: json['owner'] ?? '',
      creation: json['creation'] ?? '',
      modified: json['modified'] ?? '',
      modifiedBy: json['modified_by'] ?? '',
      docstatus: json['docstatus'] ?? 0,
      idx: json['idx'] ?? 0,
      subject: json['subject'] ?? '',
      ready: json['ready'] ?? 0,
      description: json['description'] ?? '',
      eventImage: json['event_image'] ?? '',
      dataTime: json['data_time'] ?? '',
    );
  }

  bool get isReady => ready == 1;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'docstatus': docstatus,
      'idx': idx,
      'subject': subject,
      'ready': ready,
      'description': description,
      'event_image': eventImage,
      'data_time': dataTime,
    };
  }
}