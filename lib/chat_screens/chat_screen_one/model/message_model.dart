class MessageModel {
  String text;
  bool fromUser;
  String time;
  bool? error;
  final bool loading;

  MessageModel({this.error, required this.text, required this.fromUser, required this.time, this.loading = false});
}