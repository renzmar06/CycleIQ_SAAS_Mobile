import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/src/onboarding/widget/fluid_card.dart';
import 'package:cycleiq_saas_mobile/src/onboarding/widget/fluid_carousel.dart';
import 'package:flutter/material.dart';

// NOTE: Agr apko ye onboarding screen use krni hain to ap nechy text ko change kr skty hain
class Showcase extends StatefulWidget {
  const Showcase({super.key});

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  void goToHome() {
    AppNav.push(context, '/loginScreen'); // Your home route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FluidCarousel(
        children: <Widget>[
          FluidCard(
            color: 'Red',
            altColor: const Color(0xFF4259B2),
            title: "Hassle-Free Waste\nPickup, Anytime",
            subtitle:
                "Schedule a pickup in seconds — we collect your waste right from your doorstep.",
          ),
          FluidCard(
            color: 'Yellow',
            altColor: const Color(0xFF904E93),
            title: "Quick Collections From\nTrusted Partners",
            subtitle:
                "Certified waste management companies ensure safe and timely disposal.",
          ),
          FluidCard(
            color: 'Blue',
            altColor: const Color(0xFFFFB138),
            title: "Track Your Pickup\nin Real-Time",
            subtitle:
                "Monitor driver arrival, view order history, and manage requests easily.",
            showContinueButton: true,
            onContinue: goToHome,
          ),
        ],
      ),
    );
  }
}
