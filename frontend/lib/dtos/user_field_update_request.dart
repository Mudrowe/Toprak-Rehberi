class UserFieldUpdateRequest {
  final String fieldName;
  final String newValue;

  UserFieldUpdateRequest({
    required this.fieldName,
    required this.newValue,
  });

  Map<String, dynamic> toJson() => {
        'fieldName': fieldName,
        'newValue': newValue,
      };
}
