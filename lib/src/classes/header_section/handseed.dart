import '../element.dart';
import '../group_code.dart';

/// Quản lý handle của bản vẽ, mỗi một đối tượng được thêm vào thì phải lấy handle
/// Sau khi thêm vào thì tăng handle lên để cho đối tượng khác
class HandSeed extends Element {
  int _handSeed = 0;

  static final Map<int, HandSeed> _cache = <int, HandSeed>{};

  factory HandSeed() {
    var handSeed = _cache[0];
    if (handSeed != null) return handSeed;
    return _cache.putIfAbsent(0, () {
      return HandSeed._internal(0);
    });
  }

  HandSeed._internal(this._handSeed) {
    groupCodes.add(GroupCode(key: 5, value: handSeed));
  }

  /// Next available handle
  int get handSeed => _handSeed;
  void increase() {
    _handSeed++;
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null) result.value = _handSeed.toRadixString(16);
  }

  @override
  Future parse() {
    var result =
        groupCodes.firstWhere((code) => code.key == 5, orElse: () => null);
    if (result != null)
      _handSeed =
          int.tryParse(result.value, radix: 16) ?? int.parse(result.value);
    return null;
  }
}
