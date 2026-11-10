import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(
      title: 'Jelajahi',
      description:
          'Temukan pakaian layak pakai dari pengguna lain dan beri kesempatan '
          'baru untuk item yang kamu sukai.',
      icon: Icons.explore_outlined,
      emptyTitle: 'Katalog akan muncul di sini',
      emptyDescription:
          'Item swap akan dimuat dari layanan DRF setelah endpoint Jelajahi '
          'tersambung.',
      features: [
        'Cari, filter, dan urutkan item swap.',
        'Simpan item yang disukai untuk dilihat kembali.',
        'Buka profil publik pemilik item.',
      ],
    );
  }
}
