import 'package:flutter/material.dart';
import 'package:my_project/model/recommendation_model.dart';

class RecommendationPage extends StatelessWidget {
  final List<RecommendationModel> recommendations = const [
    RecommendationModel(
      nama: 'Andi Wijaya',
      posisi: 'Software Engineer',
      skorRekomendasi: 0.95,
    ),
    RecommendationModel(
      nama: 'Budi Santoso',
      posisi: 'UI/UX Designer',
      skorRekomendasi: 0.91,
    ),
    RecommendationModel(
      nama: 'Citra Lestari',
      posisi: 'Project Manager',
      skorRekomendasi: 0.89,
    ),
  ];

  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Rekomendasi Karyawan Teladan',
          style: TextStyle(
            fontSize: 18,
          ),
          ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final rec = recommendations[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text(rec.nama),
              subtitle: Text(rec.posisi),
              trailing: Text(
                '${(rec.skorRekomendasi * 100).toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
