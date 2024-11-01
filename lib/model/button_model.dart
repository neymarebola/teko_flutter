class Button {
  final String? text;

  Button({this.text});

  factory Button.fromJson(Map<String, dynamic> json) => Button(
        text: json['text'] as String?,
      );
}
