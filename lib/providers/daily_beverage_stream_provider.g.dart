// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_beverage_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dailyBeverageStream)
final dailyBeverageStreamProvider = DailyBeverageStreamProvider._();

final class DailyBeverageStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DrinkLogEntry>>,
          List<DrinkLogEntry>,
          Stream<List<DrinkLogEntry>>
        >
    with
        $FutureModifier<List<DrinkLogEntry>>,
        $StreamProvider<List<DrinkLogEntry>> {
  DailyBeverageStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyBeverageStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyBeverageStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<DrinkLogEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DrinkLogEntry>> create(Ref ref) {
    return dailyBeverageStream(ref);
  }
}

String _$dailyBeverageStreamHash() =>
    r'2dc41201b5a8becd12680d9b7e37d83ff3854ec5';
