class UploadLocationImageModel {
  final bool success;
  final UploadData? data;
  final UploadError? error;

  UploadLocationImageModel({required this.success, this.data, this.error});

  factory UploadLocationImageModel.fromJson(Map<String, dynamic> json) {
    return UploadLocationImageModel(
      success: json['success'] ?? false,
      data: json['data'] != null ? UploadData.fromJson(json['data']) : null,
      error: json['error'] != null ? UploadError.fromJson(json['error']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'error': error?.toJson(),
    };
  }
}

class UploadData {
  final int id;
  final String status;

  UploadData({required this.id, required this.status});

  factory UploadData.fromJson(Map<String, dynamic> json) {
    return UploadData(id: json['id'] ?? 0, status: json['status'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'status': status};
  }
}

class UploadError {
  final int code;
  final String message;
  final int httpStatus;
  final String details;

  UploadError({
    required this.code,
    required this.message,
    required this.httpStatus,
    required this.details,
  });

  factory UploadError.fromJson(Map<String, dynamic> json) {
    return UploadError(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      httpStatus: json['httpStatus'] ?? 0,
      details: json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'httpStatus': httpStatus,
      'details': details,
    };
  }
}
