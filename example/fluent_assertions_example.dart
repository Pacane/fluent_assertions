import 'package:fluent_assertions/fluent_assertions.dart';
import 'package:test/test.dart';

int compute() => 12;

int failToCompute() => throw Exception('Uh Oh!');

Future<int> computeAsync() async => 14;

void main() {
  test('compute returns 12', () {
    compute().should().be(12);
  });

  test('failToCompute throws', () {
    (() => failToCompute()).shouldThrow(isException);
  });

  test('failToCompute throws (predicate)', () {
    (() => failToCompute()).shouldThrow((e) => e is Exception);
  });

  test('works with futures', () {
    computeAsync().should().be(12);
  });
}
