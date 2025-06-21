import 'package:flutter/material.dart';
import 'package:my_project/model/kpi_model.dart';

class KPIListPage extends StatelessWidget {
  KPIListPage({Key? key}) : super(key: key);

  // Contoh data KPI statis (bisa diganti dari API/DB)
  final List<KpiModel> kpiList = [
    KpiModel(nama: "Andi", indikator: "Produktivitas", nilai: 92.5, satuan: "%"),
    KpiModel(nama: "Budi", indikator: "Kehadiran", nilai: 97.2, satuan: "%"),
    KpiModel(nama: "Citra", indikator: "Kepatuhan", nilai: 88.1, satuan: "%"),
    KpiModel(nama: "Dewi", indikator: "Komitmen", nilai: 85.7, satuan: "%"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade700,
        title: const Text(
          "Daftar KPI Karyawan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implementasi filter
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementasi pencarian
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade700,
        child: const Icon(Icons.add),
        onPressed: () {
          // Implementasi tambah KPI baru
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Header dengan ringkasan
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ringkasan KPI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSummaryCard("Rata-rata", "${_calculateAverage().toStringAsFixed(1)}%"),
                      _buildSummaryCard("Tertinggi", "${_findHighestValue().toStringAsFixed(1)}%"),
                      _buildSummaryCard("Terendah", "${_findLowestValue().toStringAsFixed(1)}%"),
                    ],
                  ),
                ],
              ),
            ),
            
            // Judul daftar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Daftar Karyawan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "${kpiList.length} Karyawan",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Daftar KPI
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: kpiList.length,
                itemBuilder: (context, index) {
                  final kpi = kpiList[index];
                  return _buildKPICard(kpi);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget kartu ringkasan
  Widget _buildSummaryCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  
  // Widget kartu KPI
  Widget _buildKPICard(KpiModel kpi) {
    // Tentukan warna berdasarkan nilai
    Color statusColor;
    if (kpi.nilai >= 90) {
      statusColor = Colors.green.shade400;
    } else if (kpi.nilai >= 80) {
      statusColor = Colors.orange.shade400;
    } else {
      statusColor = Colors.red.shade400;
    }
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red.shade100,
                      child: Text(
                        kpi.nama[0],
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      kpi.nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${kpi.nilai}${kpi.satuan}",
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      kpi.indikator,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      _getStatusIcon(kpi.nilai),
                      size: 16,
                      color: statusColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _getStatusText(kpi.nilai),
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: kpi.nilai / 100,
                backgroundColor: Colors.grey.shade200,
                color: statusColor,
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper untuk mendapatkan ikon status
  IconData _getStatusIcon(double nilai) {
    if (nilai >= 90) return Icons.emoji_events;
    if (nilai >= 80) return Icons.trending_up;
    return Icons.warning_amber;
  }
  
  // Helper untuk mendapatkan teks status
  String _getStatusText(double nilai) {
    if (nilai >= 90) return "Sangat Baik";
    if (nilai >= 80) return "Baik";
    return "Perlu Perbaikan";
  }
  
  // Helper untuk menghitung rata-rata
  double _calculateAverage() {
    double total = 0;
    for (var kpi in kpiList) {
      total += kpi.nilai;
    }
    return total / kpiList.length;
  }
  
  // Helper untuk menemukan nilai tertinggi
  double _findHighestValue() {
    double highest = 0;
    for (var kpi in kpiList) {
      if (kpi.nilai > highest) highest = kpi.nilai;
    }
    return highest;
  }
  
  // Helper untuk menemukan nilai terendah
  double _findLowestValue() {
    if (kpiList.isEmpty) return 0;
    double lowest = kpiList[0].nilai;
    for (var kpi in kpiList) {
      if (kpi.nilai < lowest) lowest = kpi.nilai;
    }
    return lowest;
  }
}