abstract class Result<F, S> {
  R fold<R>(R Function(F error) ifFailure, R Function(S data) ifSuccess);
  F? getFailureResponse();
  S? getSuccessResponse();
  bool hasSuccess();
  bool hasError();
}

class Failure<F, S> extends Result<F, S> {
  final F _f;
  Failure(this._f);
  F get value => _f;

  @override
  R fold<R>(R Function(F error) ifFailure, R Function(S data) ifSuccess) =>
      ifFailure(_f);
  @override
  bool hasSuccess() => false;
  @override
  bool hasError() => true;
  @override
  F? getFailureResponse() => _f;
  @override
  S? getSuccessResponse() => null;
}

class Success<F, S> extends Result<F, S> {
  final S _s;
  Success(this._s);
  S get value => _s;

  @override
  R fold<R>(R Function(F error) ifFailure, R Function(S data) ifSuccess) =>
      ifSuccess(_s);
  @override
  bool hasSuccess() => true;
  @override
  bool hasError() => false;
  @override
  F? getFailureResponse() => null;
  @override
  S? getSuccessResponse() => _s;
}
