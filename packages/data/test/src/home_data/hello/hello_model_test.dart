import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  group('isEmpty', () {
    test('should return true when object is empty.', () async {
      const model = HelloModel.empty;
      expect(model.isEmpty, true);
    });

    test('should return false when object is not empty.', () async {
      const model = HelloModel(message: 'message');
      expect(model.isEmpty, false);
    });
  });

  group('isNotEmpty', () {
    test('should return true when object is not empty.', () async {
      const model = HelloModel(message: 'message');
      expect(model.isNotEmpty, true);
    });

    test('should return false when object is empty.', () async {
      const model = HelloModel.empty;
      expect(model.isNotEmpty, false);
    });
  });
}
