class NotificationItem {
  final String title;
  final String content;
  final String time;

  NotificationItem({this.title, this.content, this.time});

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      title: json['title'],
      content: json['content'],
      time: json['time'],
    );
  }
}
