import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsAppButton extends StatefulWidget {
  const WhatsAppButton({Key? key}) : super(key: key);

  @override
  WhatsAppButtonState createState() => WhatsAppButtonState();
}

class WhatsAppButtonState extends State<WhatsAppButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Tooltip(
        message: 'Chat on WhatsApp',
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => openURL(StaticUtils.whatsApp),
          onHover: (hovering) => setState(() => isHover = hovering),
          child: AnimatedScale(
            scale: isHover ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF25D366),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(60),
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 3.0),
                  ),
                ],
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
