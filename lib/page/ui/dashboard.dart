import 'package:flutter/material.dart';

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
          // Menampilkan menu di dalam dashboard
          ListTile(
            title: const Text('Lihat Data KPI'),
            onTap: () {
              Navigator.pushNamed(context, '/kpiList'); // Ganti dengan nama route yang sesuai
            },
          ),
          ListTile(
            title: const Text('Kelola Data KPI'),
            onTap: () {
              Navigator.pushNamed(context, '/manageKpi'); // Ganti dengan nama route yang sesuai
            },
          ),
          ListTile(
            title: const Text('Rekomendasi Karyawan'),
            onTap: () {
              Navigator.pushNamed(context, '/recommendation'); // Ganti dengan nama route yang sesuai
            },
          ),
          // ListTile(
          //   title: Text('Masuk ke deep web'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '');
          //   },
          // ),
        ],
      ),
    );
  }
}
