class EventsModel {
  final String name;
  final String owner;
  final String creation;
  final String modified;
  final String modifiedBy;
  final int docstatus;
  final int idx;
  final String eventName;
  final int ready;
  final int bigEvent;
  final String eventInfo;
  final String eventImage;
  final String location;
  final String dataTime;

  EventsModel({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.eventName,
    required this.ready,
    required this.bigEvent,
    required this.eventInfo,
    required this.eventImage,
    required this.location,
    required this.dataTime,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      name: json['name'] ?? '',
      owner: json['owner'] ?? '',
      creation: json['creation'] ?? '',
      modified: json['modified'] ?? '',
      modifiedBy: json['modified_by'] ?? '',
      docstatus: json['docstatus'] ?? 0,
      idx: json['idx'] ?? 0,
      eventName: json['event_name'] ?? '',
      ready: json['ready'] ?? 0,
      bigEvent: json['big_event'] ?? 0,
      eventInfo: json['event_info'] ?? '',
      eventImage: json['event_image'] ?? '',
      location: json['location'] ?? '',
      dataTime: json['data_time'] ?? '',
    );
  }

  bool get isReady => ready == 1;
  bool get isBigEvent => bigEvent == 1;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'docstatus': docstatus,
      'idx': idx,
      'event_name': eventName,
      'ready': ready,
      'big_event': bigEvent,
      'event_info': eventInfo,
      'event_image': eventImage,
      'location': location,
      'data_time': dataTime,
    };
  }
}