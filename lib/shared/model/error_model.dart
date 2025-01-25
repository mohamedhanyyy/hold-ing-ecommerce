class ErrorModel {
  String? error;
  String? errorDescription;
  String? errorUri;

  ErrorModel({this.error, this.errorDescription, this.errorUri});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
    errorUri = json['error_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['error_description'] = errorDescription;
    data['error_uri'] = errorUri;
    return data;
  }
}
