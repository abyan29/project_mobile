import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const MenuCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
