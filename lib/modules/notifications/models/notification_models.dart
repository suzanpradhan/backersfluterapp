class NotificationModel {
  final String message;

  NotificationModel({required this.message});

  factory NotificationModel.fromJsonForGetAllPosts(
      {required Map<String, dynamic> map}) {
    return NotificationModel(
      message: map["description"],
    );
  }
}
