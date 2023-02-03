import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';

void main() {
  

  setUp(() {
    
  });

  Widget createWidgetUnderTest() {
    return const MaterialApp(
        title: 'Transfer Screen',
        home: TransferScreen());
  }
  group('Transfer Screen', () {

    testWidgets(
      "Should render Info Account Transfer widget",
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(createWidgetUnderTest());

          await tester.pumpAndSettle();

          expect(
              find.byKey(const Key('transfer_widget')),findsOneWidget);
        });
      },
    );
  });
}
