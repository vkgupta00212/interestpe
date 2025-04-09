import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interestpe/utility/routes.dart';
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
                _buildMenuItem(
                  Icons.person_outline,
                  "Profile",
                      () {
                    Navigator.pushNamed(context, MyRoutes.profileMain);
                  },
                ),
                _buildMenuItem(
                  Icons.handshake_outlined,
                  "Help & Support",
                      () {
                    print("Help & Support tapped");
                  },
                ),
                _buildMenuItem(
                  Icons.description_outlined,
                  "T & C",
                      () {
                    print("T & C tapped");
                  },
                ),
                _buildMenuItem(
                  Icons.settings_outlined,
                  "Settings",
                      () {
                    print("Settings tapped");
                  },
                ),
              ],
            ),
            const SizedBox(height: 16), // Add spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuItem(
                  Icons.privacy_tip_outlined,
                  "Privacy & Policy",
                      () {
                    print("Privacy & Policy tapped");
                  },
                ),
                _buildMenuItem(
                  Icons.share_outlined,
                  "Share",
                      () {
                    print("Share tapped");
                  },
                ),
                _buildMenuItem(
                  Icons.assessment_outlined,
                  "Master Report",
                      () {
                    print("Master Report tapped");
                  },
                ),
                const SizedBox(width: 70), // Maintain alignment
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return SizedBox(
      width: 70,
      height: 90,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12), // optional ripple radius
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
              child: Icon(icon, size: 24, color: const Color(0xFF2C2B2B)),
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
      ),
    );
  }
}
