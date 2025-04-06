import 'package:flutter/material.dart';
import 'package:interestpe/utility/routes.dart';
import 'package:interestpe/widgets/profile/profile_moreCard.dart';
import '../../pages/interest_chat/lend_money.dart';
import '../../pages/interest_chat/accept_money.dart';


class profileNavbar extends StatelessWidget {
  const profileNavbar({super.key});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomAppBar(
        height: 150,
        color: Colors.white,
        child: Column(
          children: [
            // Full-width _moreProfile()

            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: _moreProfile(context),
            ),
            ),
            SizedBox(height: 2),

            Expanded(child: _dueBalance()),
            SizedBox(height: 2),

            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: _buildActionButtons(context),
            ),
            ),

          ],
        ),
      ),
    );
  }
}

Widget _buildActionButtons(BuildContext context) {
  return Container(
    color: Colors.grey[200], // Light grey background
    child: Row(
      children: [
        Expanded(
          child : SizedBox(
            height: 30,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_upward, color: Colors.red),
                label: const Text('Lend Money',
                    style: TextStyle(color: Colors.red)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White button background
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false, // Allow transparency for overlay effect if needed
                      transitionDuration: const Duration(milliseconds: 250),
                      pageBuilder: (context, animation, secondaryAnimation) => LendMoney(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child : SizedBox(
              height: 30,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_downward, color: Colors.green),
                label: const Text('Accept Money',
                    style: TextStyle(color: Colors.green)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White button background
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false, // Allow transparency for overlay effect if needed
                        transitionDuration: const Duration(milliseconds: 250),
                          pageBuilder: (context, animation, secondaryAnimation) => AcceptMoney(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                        opacity: animation,
                        child: child,
                        );
                      },
                     ),
                    );
                }
                ),
          ),
        ),
      ],
    ),
  );
}

Widget _dueBalance() {
  return Container(
    color: Colors.grey[200],
    padding: EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding
    child: Center( // Center the entire row horizontally
      child: Row(
        mainAxisSize: MainAxisSize.min, // Shrink-wrap the row's width
        children: [
          Text(
            "Balance Due",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          SizedBox(width: 160), // Increased gap between texts
          Text(
            "₹5000",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _moreProfile(BuildContext context) {
  return Container(
    color: Colors.grey[200], // Light grey background
    child: Row(
      children: [
        Expanded(
          child : GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return const ProfileMore();
              },
            ),
            child : SizedBox(
                child: Icon(Icons.arrow_upward)
            ),
          ),
        ),
      ],
    ),
  );
}
