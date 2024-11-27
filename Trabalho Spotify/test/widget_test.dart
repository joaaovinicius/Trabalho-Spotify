import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone/main.dart'; // Corrigido para o nome do pacote

void main() {
  testWidgets('Verifica se o título "Boa noite" aparece na tela', (WidgetTester tester) async {
    // Inicializa o widget sem o 'const'
    await tester.pumpWidget(SpotifyCloneApp());

    // Verifica se o texto "Boa noite" está visível
    expect(find.text('Boa noite'), findsOneWidget);
  });
}
