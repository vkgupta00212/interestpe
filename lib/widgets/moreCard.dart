import 'package:flutter/material.dart';
import '../../constants.dart';

class BusinessBottomSheet extends StatelessWidget {
  const BusinessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuItem(Icons.person_outline, "Profile"),
              _buildMenuItem(Icons.help_outline, "Help & Support"),
              _buildMenuItem(Icons.description_outlined, "T & C"),
              _buildMenuItem(Icons.settings_outlined, "Settings"),
            ],
          ),

          // Second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuItem(Icons.privacy_tip_outlined, "Privacy & Policy"),
              _buildMenuItem(Icons.share_outlined, "Share"),
              _buildMenuItem(Icons.assessment_outlined, "Master Report"),
              const SizedBox(width: 70), // Balance space
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, size: 24, color: kPrimaryColor),
          ),
          const SizedBox(height: 8),
          // Text label with fixed height
          SizedBox(
            height: 36, // Fixed height for text
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2, // Allow text to wrap
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}