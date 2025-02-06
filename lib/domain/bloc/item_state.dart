part of 'item_cubit.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;

  const factory ItemState.loading({
    @Default(true) bool showLoading,
  }) = _Loading;

  const factory ItemState.loaded(List<Item> items) = _Loaded;

  const factory ItemState.singleLoaded(Item item) = _SingleLoaded;

  const factory ItemState.empty() = _Empty;

  const factory ItemState.error(String message) = _Error;

  const factory ItemState.success(String message) = _Success;
}
