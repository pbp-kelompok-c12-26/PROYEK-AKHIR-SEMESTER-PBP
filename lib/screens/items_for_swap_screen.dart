import 'package:flutter/material.dart';

import '../widgets/module_screen.dart';

class ItemsForSwapScreen extends StatelessWidget {
  const ItemsForSwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(
      title: 'Item Swap Saya',
      description:
          'Atur pakaian dari lemari yang sedang kamu tawarkan untuk ditukar.',
      icon: Icons.swap_horiz_outlined,
      emptyTitle: 'Belum ada item swap',
      emptyDescription:
          'Penawaran pakaianmu akan dimuat dari backend PWS.',
      features: [
        'Tawarkan pakaian dari lemari untuk ditukar.',
        'Atur detail dan lokasi pertemuan.',
        'Pantau status penawaran atau kembalikan pakaian ke lemari.',
      ],
    );
  }
}
