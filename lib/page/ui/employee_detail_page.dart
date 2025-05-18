import 'package:flutter/material.dart';
import 'package:my_project/model/employee_model.dart';

class EmployeeDetailPage extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailPage({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.nama,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('Posisi: ${employee.posisi}'),
                Text('Departemen: ${employee.departemen}'),
                const SizedBox(height: 20),
                const Text(
                  'Tentang Karyawan:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(employee.deskripsi ?? "Tidak ada deskripsi tersedia."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
