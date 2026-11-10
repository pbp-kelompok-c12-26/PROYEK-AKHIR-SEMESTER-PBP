import 'package:flutter/material.dart';

import 'screens/account_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/items_for_swap_screen.dart';
import 'screens/outfit_calendar_screen.dart';
import 'screens/swap_requests_screen.dart';
import 'screens/wardrobe_screen.dart';

void main() {
  runApp(const SwapDrobeApp());
}

class SwapDrobeApp extends StatelessWidget {
  const SwapDrobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const plum = Color(0xFF8C3F5B);

    return MaterialApp(
      title: 'SwapDrobe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: plum),
        scaffoldBackgroundColor: const Color(0xFFFFFAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFAFC),
          foregroundColor: Color(0xFF34252B),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFFFFFAFC),
          indicatorColor: Color(0xFFF2DCE5),
        ),
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  static const _screens = <Widget>[
    ExploreScreen(),
    WardrobeScreen(),
    OutfitCalendarScreen(),
    ItemsForSwapScreen(),
    SwapRequestsScreen(),
  ];

  void _openAccount() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.checkroom_rounded,
                color: Colors.white,
                size: 21,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'SwapDrobe',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Akun dan profil',
            onPressed: _openAccount,
            icon: const Icon(Icons.account_circle_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Jelajahi',
          ),
          NavigationDestination(
            icon: Icon(Icons.checkroom_outlined),
            selectedIcon: Icon(Icons.checkroom_rounded),
            label: 'Lemari',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month_rounded),
            label: 'Kalender',
          ),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz_rounded),
            label: 'Item Swap',
          ),
          NavigationDestination(
            icon: Icon(Icons.markunread_mailbox_outlined),
            selectedIcon: Icon(Icons.markunread_mailbox_rounded),
            label: 'Request',
          ),
        ],
      ),
    );
  }
}
