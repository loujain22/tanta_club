class UserModel {
  final String membershipId;
  final String memberName;
  final String image;
  final String numberOfKins;

  UserModel({
    required this.membershipId,
    required this.memberName,
    required this.image,
    required this.numberOfKins,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['message']['data'];
    return UserModel(
      membershipId: data['membership_id'] ?? '',
      memberName: data['member_name'] ?? '',
      image: data['image'] ?? '',
      numberOfKins: data['number_of_kins'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'membership_id': membershipId,
      'member_name': memberName,
      'image': image,
      'number_of_kins': numberOfKins,
    };
  }
}
