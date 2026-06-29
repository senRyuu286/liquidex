// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_tracker_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiquidTrackerController)
final liquidTrackerControllerProvider = LiquidTrackerControllerProvider._();

final class LiquidTrackerControllerProvider
    extends $NotifierProvider<LiquidTrackerController, List<DrinkLogEntry>> {
  LiquidTrackerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liquidTrackerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liquidTrackerControllerHash();

  @$internal
  @override
  LiquidTrackerController create() => LiquidTrackerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DrinkLogEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DrinkLogEntry>>(value),
    );
  }
}

String _$liquidTrackerControllerHash() =>
    r'081468ff3780351c80fc453cc1717515080d7140';

abstract class _$LiquidTrackerController
    extends $Notifier<List<DrinkLogEntry>> {
  List<DrinkLogEntry> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<DrinkLogEntry>, List<DrinkLogEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DrinkLogEntry>, List<DrinkLogEntry>>,
              List<DrinkLogEntry>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
