class DonationResponse {
  final bool success;
  final String message;
  final int donationId;

  DonationResponse({
    required this.success,
    required this.message,
    required this.donationId,
  });

  factory DonationResponse.fromJson(Map<String, dynamic> json) {
    return DonationResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      donationId: json['donation_id'] ?? 0,
    );
  }
}
