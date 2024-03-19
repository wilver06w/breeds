class Token {
  late final String? accessToken;

  Token({
    this.accessToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['accessToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }
}
