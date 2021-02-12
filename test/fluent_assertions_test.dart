import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

void main() {
  group('should be', () {
    test('throws TestFailure when mismatch', () {
      expect(() => 13.should().be(12), throwsA((e) => e is TestFailure));
    });

    test('completes fine when values match', () {
      12.should().be(12);
    });

    test('works with Futures', () async {
      var future = Future.value(12);

      future.should().be(12);
    });
  });

  group('should throw', () {
    var thrower = () => throw Exception('error');

    test('accepts a matcher', () {
      thrower.shouldThrow((e) => e is Exception);
    });

    test('fails when no exception was thrown', () {
      var fine = () {};

      expect(() => fine.shouldThrow((e) => e is Exception),
          throwsA((e) => e is TestFailure));
    });
  });
}
