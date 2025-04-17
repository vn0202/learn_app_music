import 'package:flutter/material.dart';
import 'package:music_app/routes/route_names.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFooterItem(
            context: context,
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              Navigator.pushNamed(context, RouteNames.home);
            },
          ),
          _buildFooterItem(
            context: context,
            icon: Icons.explore,
            label: 'Explore',
          ),
          _buildFooterItem(context: context, icon: Icons.add, label: 'Add'),
          _buildFooterItem(context: context, icon: Icons.person, label: 'User'),
        ],
      ),
    );
  }

  Widget _buildFooterItem({
    required context,
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24.0, color: Colors.black),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: const TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
