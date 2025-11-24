import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Security & Wallet",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------------------
            // REWARDS / POINTS
            // ------------------------------
            const Text(
              "Rewards & Points",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _rewardsCard(points: "420", rank: "Eco Warrior"),

            const SizedBox(height: 32),

            // ------------------------------
            // WALLET & PAYOUT
            // ------------------------------
            const Text(
              "Wallet & Payments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _walletCard(balance: "₹ 1,280"),
            const SizedBox(height: 10),
            _payoutHistoryButton(context),

            const SizedBox(height: 32),

            // ------------------------------
            // DONATION OPTION
            // ------------------------------
            const Text(
              "Donate for a Cause",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _donationTile(),

            const SizedBox(height: 32),

            // ------------------------------
            // UPLOAD PROOF (Bag Drop)
            // ------------------------------
            const Text(
              "Upload Bag Drop Proof",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _uploadProofSection(),

            const SizedBox(height: 40),

            // ------------------------------
            // SECURITY SETTINGS
            // ------------------------------
            const Text(
              "Security Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _settingTile(Icons.lock_outline, "Change Password"),
            _settingTile(Icons.shield_outlined, "Two-Factor Authentication"),
            _settingTile(Icons.privacy_tip_outlined, "Privacy Controls"),
          ],
        ),
      ),
    );
  }

  // ------------------------------
  // REWARDS CARD
  // ------------------------------
  Widget _rewardsCard({required String points, required String rank}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.star_rounded,
              color: Colors.green,
              size: 34,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$points pts",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                rank,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ------------------------------
  // WALLET BALANCE CARD
  // ------------------------------
  Widget _walletCard({required String balance}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.black87,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Wallet Balance",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                balance,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ------------------------------
  // PAYOUT HISTORY BUTTON
  // ------------------------------
  Widget _payoutHistoryButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate → /payout-history
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Text(
          "View Payout History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // ------------------------------
  // DONATION TILE
  // ------------------------------
  Widget _donationTile() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.favorite_rounded, color: Colors.green.shade700, size: 32),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "Donate your recycling earnings to a school or environment fund",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  // ------------------------------
  // UPLOAD PROOF
  // ------------------------------
  Widget _uploadProofSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.cloud_upload_rounded,
            color: Colors.black.withOpacity(.7),
            size: 48,
          ),
          const SizedBox(height: 12),
          const Text(
            "Upload Bag Drop Proof",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "Upload a photo as proof of your recycling drop-off.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Upload Image",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------
  // SECURITY TILE
  // ------------------------------
  Widget _settingTile(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () {},
    );
  }
}
