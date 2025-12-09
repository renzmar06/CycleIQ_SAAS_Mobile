import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/scheduler.dart';

class FluidCard extends StatefulWidget {
  final String color;
  final Color altColor;
  final String title;
  final String subtitle;
  final bool showContinueButton;
  final VoidCallback? onContinue;

  const FluidCard({
    super.key,
    required this.color,
    this.title = "",
    required this.subtitle,
    required this.altColor,
    this.showContinueButton = false,
    this.onContinue,
  });

  @override
  State<FluidCard> createState() => _FluidCardState();
}

class _FluidCardState extends State<FluidCard> {
  late Ticker _ticker;
  bool _navigated = false; // ✅ prevents double / weird taps

  @override
  void initState() {
    super.initState();
    _ticker = Ticker((d) {
      if (mounted) {
        setState(() {});
      }
    })..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _handleContinueTap() {
    if (_navigated) return; // ✅ ignore any second tap
    _navigated = true;

    // ✅ stop animation so it doesn’t fight with navigation
    _ticker.stop();

    // ✅ run navigation after this frame is done
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onContinue?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final time = DateTime.now().millisecondsSinceEpoch / 2000;
        final scaleX = 1.2 + sin(time) * .05;
        final scaleY = 1.2 + cos(time) * .07;
        final offsetY = 20 + cos(time) * 20;
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Transform.translate(
              offset: Offset(
                -(scaleX - 1) / 2 * width,
                -(scaleY - 1) / 2 * height + offsetY,
              ),
              child: Transform(
                transform: Matrix4.diagonal3Values(scaleX, scaleY, 1),
                child: Image.asset(
                  'assets/images/Bg-${widget.color}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 75.0, bottom: 25.0),
                child: Column(
                  children: <Widget>[
                    // Top Image
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Image.asset(
                          'assets/images/Illustration-${widget.color}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Slider circles
                    SizedBox(
                      height: 14,
                      child: Image.asset(
                        'assets/images/Slider-${widget.color}.png',
                      ),
                    ),

                    // Bottom content
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: _buildBottomContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.2,
            fontSize: 30.0,
            fontFamily: 'MarcellusSC',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            fontFamily: 'Lexend',
            color: Colors.white.withOpacity(0.7),
          ),
        ),

        if (widget.showContinueButton)
          Listener(
            // ✅ RAW touch listener (bypasses gesture arena)
            behavior: HitTestBehavior.opaque,
            onPointerDown: (_) {
              _handleContinueTap(); // ✅ Will fire on FIRST touch always
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.9),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
      ],
    );
  }
}
