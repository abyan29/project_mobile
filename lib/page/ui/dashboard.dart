import 'package:flutter/material.dart';
import 'package:my_project/widget/menu_card.dart'; // Pastikan path-nya benar

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Menu Utama"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Menu Utama',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // Gunakan komponen yang dipisah
          MenuCard(
            title: 'Lihat Data KPI',
            icon: Icons.analytics_outlined,
            iconColor: Colors.orange,
            onTap: () {
              Navigator.pushNamed(context, '/kpiList');
            },
          ),
          MenuCard(
            title: 'Kelola Data KPI',
            icon: Icons.edit_note,
            iconColor: Colors.green,
            onTap: () {
              Navigator.pushNamed(context, '/manageKpi');
            },
          ),
          MenuCard(
            title: 'Rekomendasi Karyawan',
            icon: Icons.recommend,
            iconColor: Colors.purple,
            onTap: () {
              Navigator.pushNamed(context, '/recommendation');
            },
          ),
        ],
      ),
    );
  }
}
