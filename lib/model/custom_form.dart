class CustomForm {
  final String? label;
  final bool? required;
  final String? name;
  final String type;
  final int? maxLength;
  final int? minValue;
  final int? maxValue;

  CustomForm({
    this.label,
    this.required,
    this.name,
    required this.type,
    this.maxLength,
    this.minValue,
    this.maxValue,
  });

  factory CustomForm.fromJson(Map<String, dynamic> json) => CustomForm(
        label: json['label'] as String?,
        required: json['required'] as bool?,
        name: json['name'] as String?,
        type: json['type'] as String,
        maxLength: json['maxLength'] as int?,
        minValue: json['minValue'] as int?,
        maxValue: json['maxValue'] as int?,
      );
}
