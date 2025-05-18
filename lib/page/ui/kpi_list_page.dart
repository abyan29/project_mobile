import 'package:flutter/material.dart';
import 'package:my_project/model/kpi_model.dart';  // Pastikan ini import model yang benar
import 'package:my_project/widget/kpi_card.dart'; // Import widget KPI card

class KPIListPage extends StatelessWidget {
  KPIListPage({Key? key}) : super(key: key);

  // Contoh data KPI statis (bisa diganti dari API/DB)
  final List<KpiModel> kpiList =  [
    KpiModel(nama: "Andi", indikator: "Produktivitas", nilai: 92.5, satuan: "%"),
    KpiModel(nama: "Budi", indikator: "Kehadiran", nilai: 97.2, satuan: "%"),
    KpiModel(nama: "Citra", indikator: "Kepatuhan", nilai: 88.1, satuan: "%"),
    KpiModel(nama: "Dewi", indikator: "Komitmen", nilai: 85.7, satuan: "%"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Daftar KPI Karyawan"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kpiList.length,
        itemBuilder: (context, index) {
          final kpi = kpiList[index];
          return KPIWidgetCard(kpi: kpi); // Pastikan widget card ini sudah benar
        },
      ),
    );
  }
}
