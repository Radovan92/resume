import 'package:flutter_test/flutter_test.dart';
import 'package:radovan_cv/pdf/cv_pdf_builder.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('CV PDF builds without overflow', () async {
    final bytes = await CvPdfBuilder.build();
    expect(bytes.length, greaterThan(1000));
  });
}
