import 'package:flutter/material.dart';
import 'package:my_project/model/kpi_model.dart';

class KPIWidgetCard extends StatelessWidget {
  final KpiModel kpi;

  const KPIWidgetCard({Key? key, required this.kpi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          kpi.nama,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Indikator: ${kpi.indikator}"),
            Text("Nilai: ${kpi.nilai} ${kpi.satuan}"),
          ],
        ),
      ),
    );
  }
}
