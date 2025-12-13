import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';
import 'package:flutter/material.dart';

class BagCard extends StatelessWidget {
  final BagModel bag;
  const BagCard({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNav.push(context, "/bag-view?qrId=${bag.id}");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Thumbnail
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: bag.images.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(
                          "${ApiConfig.domain}${bag.images.first}",
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: bag.images.isEmpty ? Colors.grey.shade300 : null,
              ),
              child: bag.images.isEmpty
                  ? Icon(Icons.image_not_supported)
                  : null,
            ),

            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bag.bagQrId,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Materials: ${bag.materials.length}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
