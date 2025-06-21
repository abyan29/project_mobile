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
    KpiModel(nama: "Citra", indikator: "Kualitas", nilai: 88.7, satuan: "%"),
  ];

  // Kontroller untuk input form
  final _namaController = TextEditingController();
  final _indikatorController = TextEditingController();
  final _nilaiController = TextEditingController();
  final _satuanController = TextEditingController();
  
  // Untuk menyimpan index data yang diedit
  int? _editingIndex;
  
  // Form key untuk validasi
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaController.dispose();
    _indikatorController.dispose();
    _nilaiController.dispose();
    _satuanController.dispose();
    super.dispose();
  }

  // Menambah atau mengedit data KPI
  void _saveKpi() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    setState(() {
      final newKpi = KpiModel(
        nama: _namaController.text,
        indikator: _indikatorController.text,
        nilai: double.tryParse(_nilaiController.text) ?? 0.0,
        satuan: _satuanController.text.isEmpty ? "%" : _satuanController.text,
      );
      
      if (_editingIndex != null) {
        // Update existing KPI
        kpiList[_editingIndex!] = newKpi;
        _editingIndex = null;
      } else {
        // Add new KPI
        kpiList.add(newKpi);
      }

      // Reset form fields
      _resetForm();
    });
  }
  
  // Reset form
  void _resetForm() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _indikatorController.clear();
    _nilaiController.clear();
    _satuanController.clear();
    _editingIndex = null;
  }

  // Edit KPI
  void _editKpi(int index) {
    final kpi = kpiList[index];
    setState(() {
      _namaController.text = kpi.nama;
      _indikatorController.text = kpi.indikator;
      _nilaiController.text = kpi.nilai.toString();
      _satuanController.text = kpi.satuan;
      _editingIndex = index;
    });
  }

  // Menghapus KPI berdasarkan index
  void _deleteKpi(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                kpiList.removeAt(index);
                if (_editingIndex == index) {
                  _resetForm();
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black87,
        title: const Text("Kelola Data KPI"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.yellow,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _editingIndex != null ? "Edit Data KPI" : "Tambah Data KPI",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Form input fields
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: "Nama KPI",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama KPI tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      
                      TextFormField(
                        controller: _indikatorController,
                        decoration: InputDecoration(
                          labelText: "Indikator KPI",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Indikator KPI tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _nilaiController,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(
                                labelText: "Nilai KPI",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nilai KPI tidak boleh kosong';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Nilai harus berupa angka';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _satuanController,
                              decoration: InputDecoration(
                                labelText: "Satuan",
                                hintText: "%",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _saveKpi,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: Icon(_editingIndex != null ? Icons.save : Icons.add),
                              label: Text(_editingIndex != null ? "Update" : "Simpan"),
                            ),
                          ),
                          if (_editingIndex != null) ...[
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _resetForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.cancel),
                                label: const Text("Batal"),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Menampilkan daftar KPI
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Daftar KPI",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${kpiList.length} data",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  
                  // List view untuk menampilkan data KPI
                  Expanded(
                    child: kpiList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.data_array,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Belum ada data KPI",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: kpiList.length,
                            itemBuilder: (context, index) {
                              final kpi = kpiList[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: _getRandomColor(index),
                                    child: Text(
                                      kpi.nama.isNotEmpty ? kpi.nama[0].toUpperCase() : "?",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    kpi.nama,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(kpi.indikator),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _getKpiColor(kpi.nilai),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          "${kpi.nilai} ${kpi.satuan}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit, color: Colors.blue),
                                        onPressed: () => _editKpi(index),
                                        tooltip: "Edit",
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () => _deleteKpi(index),
                                        tooltip: "Hapus",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper method to get indicator color based on KPI value
  Color _getKpiColor(double nilai) {
    if (nilai >= 90) {
      return Colors.green;
    } else if (nilai >= 75) {
      return Colors.blue;
    } else if (nilai >= 60) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
  
  // Helper method to get random color for avatar
  Color _getRandomColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
    ];
    return colors[index % colors.length];
  }
}