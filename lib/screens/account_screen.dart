import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akun & Profil')),
      body: const ModuleScreen(
        title: 'Akun & Profil',
        description:
            'Kelola informasi profil, preferensi gaya, dan keamanan akun.',
        icon: Icons.account_circle_outlined,
        emptyTitle: 'Profil akan tampil di sini',
        emptyDescription:
            'Informasi akun akan dimuat dari backend PWS setelah endpoint '
            'autentikasi dan profil tersambung.',
        features: [
          'Registrasi, login, dan logout.',
          'Lihat dan ubah profil serta preferensi ukuran.',
          'Kelola keamanan dan pengaturan akun.',
        ],
      ),
    );
  }
}
