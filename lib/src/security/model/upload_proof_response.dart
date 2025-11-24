class UploadProofResponse {
  final bool success;
  final String message;
  final String fileUrl;

  UploadProofResponse({
    required this.success,
    required this.message,
    required this.fileUrl,
  });

  factory UploadProofResponse.fromJson(Map<String, dynamic> json) {
    return UploadProofResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      fileUrl: json['file_url'] ?? '',
    );
  }
}
