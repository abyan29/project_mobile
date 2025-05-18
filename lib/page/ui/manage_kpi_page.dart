import 'package:flutter/material.dart';
import 'package:my_project/model/kpi_model.dart';

class ManageKpiPage extends StatefulWidget {
  const ManageKpiPage({Key? key}) : super(key: key);

  @override
  _ManageKpiPageState createState() => _ManageKpiPageState();
}

class _ManageKpiPageState extends State<ManageKpiPage> {
  // List untuk menyimpan data KPI
  List<KpiModel> kpiList = [
    KpiModel(nama: "Andi", indikator: "Produktivitas", nilai: 92.5, satuan: "%"),
    KpiModel(nama: "Budi", indikator: "Kehadiran", nilai: 97.2, satuan: "%"),
  ];

  // Kontroller untuk input form
  final _namaController = TextEditingController();
  final _indikatorController = TextEditingController();
  final _nilaiController = TextEditingController();
  final _satuanController = TextEditingController();

  // Menambah atau mengedit data KPI
  void _saveKpi() {
    setState(() {
      kpiList.add(KpiModel(
        nama: _namaController.text,
        indikator: _indikatorController.text,
        nilai: double.tryParse(_nilaiController.text) ?? 0.0,
        satuan: _satuanController.text,
      ));

      // Reset form fields
      _namaController.clear();
      _indikatorController.clear();
      _nilaiController.clear();
      _satuanController.clear();
    });
  }

  // Menghapus KPI berdasarkan index
  void _deleteKpi(int index) {
    setState(() {
      kpiList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Kelola Data KPI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form untuk input data KPI
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: "Nama KPI"),
            ),
            // TextField(
            //   controller: _indikatorController,
            //   decoration: const InputDecoration(labelText: "Indikator KPI"),
            // ),
            TextField(
              controller: _nilaiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Nilai KPI"),
            ),
            // TextField(
            //   controller: _satuanController,
            //   decoration: const InputDecoration(labelText: "Satuan KPI"),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveKpi,
              child: const Text("Simpan KPI"),
            ),
            SizedBox(height: 20),
            // Menampilkan daftar KPI
            Expanded(
              child: ListView.builder(
                itemCount: kpiList.length,
                itemBuilder: (context, index) {
                  final kpi = kpiList[index];
                  return Card(
                    child: ListTile(
                      title: Text(kpi.nama),
                      subtitle: Text('${kpi.indikator}: ${kpi.nilai} ${kpi.satuan}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteKpi(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
