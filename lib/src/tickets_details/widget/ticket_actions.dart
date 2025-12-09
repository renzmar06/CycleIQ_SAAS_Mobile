import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/screen/pdf_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TicketActions extends StatelessWidget {
  final TicketModel ticket;

  const TicketActions({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PdfViewScreen(url: ticket.type),
                ),
              );
            },
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text("Evidence"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Share.share("I earned \$${ticket.payout} from recycling! 🌍♻️");
            },
            icon: const Icon(Icons.share),
            label: const Text("Share"),
          ),
        ),
      ],
    );
  }
}
