import '../element.dart';

/// Quản lý handle của bản vẽ, mỗi một đối tượng được thêm vào thì phải lấy handle
/// Sau khi thêm vào thì tăng handle lên để cho đối tượng khác
class HandSeed extends Element {
  int _handSeed;

  /// Next available handle
  String get handSeed => _handSeed.toRadixString(16);
  void increase() {
    _handSeed++;
    var result = groupCodes.firstWhere((code) => code.key == 5 ,orElse: () => null);
    if (result != null) result.value = _handSeed.toRadixString(16);
  }

  @override
  Future parse() {
    var result = groupCodes.firstWhere((code) => code.key == 5 ,orElse: () => null);
    if (result != null) _handSeed = int.tryParse(result.value, radix: 16) ?? int.parse(result.value);
    return null;
  }

}