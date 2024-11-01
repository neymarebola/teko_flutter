class Label {
  final String? text;

  Label({this.text});

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        text: json['text'] as String?,
      );
}
