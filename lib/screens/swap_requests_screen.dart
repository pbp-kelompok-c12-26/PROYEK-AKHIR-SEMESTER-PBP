import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class SwapRequestsScreen extends StatelessWidget {
  const SwapRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(
      title: 'Permintaan Swap',
      description:
          'Lihat permintaan yang kamu kirim dan terima, lalu ikuti proses '
          'pertukarannya.',
      icon: Icons.markunread_mailbox_outlined,
      emptyTitle: 'Permintaan swap akan tampil di sini',
      emptyDescription:
          'Daftar permintaan akan dimuat dari layanan DRF setelah endpoint '
          'tersambung.',
      features: [
        'Lihat permintaan masuk dan keluar.',
        'Terima atau tolak permintaan pertukaran.',
        'Konfirmasi penyelesaian atau pembatalan swap.',
      ],
    );
  }
}
