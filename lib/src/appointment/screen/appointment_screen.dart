import 'package:cycleiq_saas_mobile/src/appointment/widget/appointment_header.dart';
import 'package:cycleiq_saas_mobile/src/appointment/widget/continue_button.dart';
import 'package:cycleiq_saas_mobile/src/appointment/widget/date_selector.dart';
import 'package:cycleiq_saas_mobile/src/appointment/widget/pickup_summary_card.dart';
import 'package:cycleiq_saas_mobile/src/appointment/widget/time_slot_selector.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Pickup Appointment",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppointmentHeader(),

            const SizedBox(height: 20),
            DateSelector(
              selectedDate: selectedDate,
              onDateSelected: (d) => setState(() => selectedDate = d),
            ),

            const SizedBox(height: 30),
            TimeSlotSelector(
              selected: selectedTime,
              onSelected: (slot) => setState(() => selectedTime = slot),
            ),

            const SizedBox(height: 30),
            PickupSummaryCard(
              date: selectedDate,
              time: selectedTime.isEmpty ? "Not selected" : selectedTime,
            ),

            const SizedBox(height: 30),
            ContinueButton(
              enabled: selectedTime.isNotEmpty,
              onPressed: () {
                /// Next step...
              },
            ),
          ],
        ),
      ),
    );
  }
}
