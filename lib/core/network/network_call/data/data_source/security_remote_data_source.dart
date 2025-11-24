abstract class SecurityRemoteDataSource {
  Future<dynamic> getRewards();
  Future<dynamic> getWalletBalance();
  Future<dynamic> getPayoutHistory();
  Future<dynamic> postDonation({
    required double amount,
    required int organizationId,
  });
  Future<dynamic> uploadProof({required String filePath});
}
