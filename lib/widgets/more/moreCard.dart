import 'package:flutter/material.dart';
import '../../constants.dart';


class BusinessBottomSheet extends StatelessWidget {
  const BusinessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kNavBackground,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
        bottom: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Important for dynamic height
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuItem(Icons.person_outline, "Profile"),
                _buildMenuItem(Icons.help_outline, "Help & Support"),
                _buildMenuItem(Icons.description_outlined, "T & C"),
                _buildMenuItem(Icons.settings_outlined, "Settings"),
              ],
            ),
            const SizedBox(height: 16), // Add spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuItem(Icons.privacy_tip_outlined, "Privacy & Policy"),
                _buildMenuItem(Icons.share_outlined, "Share"),
                _buildMenuItem(Icons.assessment_outlined, "Master Report"),
                const SizedBox(width: 70), // Maintain alignment
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return SizedBox(
        width: 70,
        height: 90,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: kNanvIconBackground,
              shape: BoxShape.circle,

        ),
        child: Icon(icon, size: 24, color: kPrimaryColor),
      ),
      const SizedBox(height: 8),
      Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      ),
      ],
      ),
    );
  }
}