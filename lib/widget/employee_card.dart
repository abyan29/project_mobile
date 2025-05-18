import 'package:flutter/material.dart';
import 'package:my_project/model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee; // Menggunakan EmployeeModel

  const EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person), // Menambahkan icon default untuk avatar
        ),
        title: Text(employee.nama), // Ganti 'name' dengan 'nama'
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Posisi: ${employee.posisi}'), // Ganti 'position' dengan 'posisi'
            Text('Departemen: ${employee.departemen}'), // Ganti 'department' dengan 'departemen'
          ],
        ),
      ),
    );
  }
}
