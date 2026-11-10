import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class WardrobeScreen extends StatelessWidget {
  const WardrobeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(
      title: 'Lemari Saya',
      description:
          'Kelola pakaian dan susun kombinasi outfit dari koleksi pribadimu.',
      icon: Icons.checkroom_outlined,
      emptyTitle: 'Lemari digitalmu akan tampil di sini',
      emptyDescription:
          'Koleksi pakaian dan outfit akan dimuat dari backend PWS.',
      features: [
        'Tambah, lihat, ubah, dan hapus pakaian.',
        'Buat outfit dari 1–5 pakaian milik sendiri.',
        'Cari, filter, urutkan, dan pilih beberapa item.',
      ],
    );
  }
}
