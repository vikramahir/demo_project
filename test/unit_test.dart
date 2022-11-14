import 'package:demo_project/utils/constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('count number', () {
    test('count number', () {
      var result = Constant.add(8, 5);
      expect(result, 13);
    });
    test('count number', () {
      var res = Constant.sub(8, 5);
      expect(res, 3);
    });
  });

}
