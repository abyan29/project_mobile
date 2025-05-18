class EmployeeModel {
  final String nama;
  final String posisi;
  final String departemen;
  final String? deskripsi; 

  const EmployeeModel({
    required this.nama,
    required this.posisi,
    required this.departemen,
    this.deskripsi,
  });
}
