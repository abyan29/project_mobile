import 'package:flutter/material.dart';
import 'package:my_project/page/ui/kpi_list_page.dart';
import 'package:my_project/page/ui/login_page.dart';
import 'package:my_project/page/ui/manage_kpi_page.dart';
import 'package:my_project/page/ui/recommendation_page.dart';
import 'package:my_project/page/ui/splash_screen.dart'; // Pastikan pathnya benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      initialRoute: '/', // Atau route awal yang sesuai
      routes: {
        '/': (context) => SplashScreen(), // Ganti dengan halaman pertama
        '/login': (context) => LoginPage(), 
        '/kpiList': (context) => KPIListPage(),
        '/manageKpi': (context) => ManageKpiPage(),
        '/recommendation': (context) => RecommendationPage(),

      },
    );
  }
}
