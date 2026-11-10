import 'package:flutter_test/flutter_test.dart';
import 'package:swapdrobe_mobile/main.dart';

void main() {
  testWidgets('Bottom navigation opens each SwapDrobe module', (
    tester,
  ) async {
    await tester.pumpWidget(const SwapDrobeApp());

    expect(find.text('Katalog akan muncul di sini'), findsOneWidget);

    await tester.tap(find.text('Lemari'));
    await tester.pumpAndSettle();
    expect(find.text('Lemari digitalmu akan tampil di sini'), findsOneWidget);

    await tester.tap(find.text('Kalender'));
    await tester.pumpAndSettle();
    expect(find.text('Jadwal outfit akan tampil di sini'), findsOneWidget);

    await tester.tap(find.text('Item Swap'));
    await tester.pumpAndSettle();
    expect(find.text('Belum ada item swap'), findsOneWidget);

    await tester.tap(find.text('Request'));
    await tester.pumpAndSettle();
    expect(find.text('Permintaan swap akan tampil di sini'), findsOneWidget);

    await tester.tap(find.byTooltip('Akun dan profil'));
    await tester.pumpAndSettle();
    expect(find.text('Profil akan tampil di sini'), findsOneWidget);
  });
}
