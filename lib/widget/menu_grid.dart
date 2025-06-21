import 'package:flutter/material.dart';
import 'package:my_project/widget/menu_item.dart';

class MenuGrid extends StatelessWidget {
  final ScrollController scrollController;

  const MenuGrid({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        MenuItem(
          title: "Lihat Data KPI",
          icon: Icons.bar_chart,
          color: Colors.indigo,
          onTap: () => Navigator.pushNamed(context, '/kpiList'),
        ),
        MenuItem(
          title: "Kelola Data KPI",
          icon: Icons.edit_document,
          color: Colors.green,
          onTap: () => Navigator.pushNamed(context, '/manageKpi'),
        ),
        MenuItem(
          title: "Rekomendasi Karyawan",
          icon: Icons.people,
          color: Colors.orange,
          onTap: () => Navigator.pushNamed(context, '/recommendation'),
        ),
      ],
    );
  }
}