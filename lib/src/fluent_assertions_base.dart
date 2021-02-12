import 'package:test/test.dart';

extension ShouldBe on Object {
  Be should() => Be(this);
}

extension ShouldBeFuture on Future {
  BeFuture should() => BeFuture(this);
}

extension ShouldThrow on Function {
  void shouldThrow(dynamic matcher) => expect(this, throwsA(matcher));
}

class Be {
  final dynamic _original;

  Be(this._original);

  void be(dynamic value) => expect(_original, value);
}

class BeFuture {
  final dynamic _original;

  BeFuture(this._original);

  void be(dynamic value) async => expect(await _original, await value);
}
