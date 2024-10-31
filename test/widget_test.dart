import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator1/main.dart';

void main() {
  testWidgets('Initial display shows 0', (WidgetTester tester) async {
    // Buat aplikasi kalkulator dan picu bingkai
    await tester.pumpWidget(KalkulatorApp());

    // Pastikan tampilan awal menunjukkan 0
    expect(find.text('0'), findsOneWidget);
  });
}
