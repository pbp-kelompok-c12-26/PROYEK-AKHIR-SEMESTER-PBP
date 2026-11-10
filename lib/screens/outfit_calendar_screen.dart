import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class OutfitCalendarScreen extends StatelessWidget {
  const OutfitCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(
      title: 'Kalender Outfit',
      description:
          'Rencanakan outfit harian dan lihat kembali riwayat pemakaian.',
      icon: Icons.calendar_month_outlined,
      emptyTitle: 'Jadwal outfit akan tampil di sini',
      emptyDescription:
          'Jadwal kalender akan dimuat dari layanan DRF setelah endpoint '
          'tersambung.',
      features: [
        'Lihat jadwal dalam kalender bulanan.',
        'Buat, ubah, dan hapus jadwal outfit.',
        'Simpan riwayat pakaian yang pernah dikenakan.',
      ],
    );
  }
}
