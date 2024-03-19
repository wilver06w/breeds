class Message {
  String message;

  Message({
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
