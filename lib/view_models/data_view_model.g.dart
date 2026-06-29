// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Status-dashboard data for the Data Screen: hydration/sugar/caffeine
/// progress against today's targets, a per-category volume breakdown,
/// and a short recent-logs preview. Derived from
/// [dailyBeverageStreamProvider], [intakeAggregatesProvider], and
/// [userTargetsProvider].

@ProviderFor(dataViewModel)
final dataViewModelProvider = DataViewModelProvider._();

/// Status-dashboard data for the Data Screen: hydration/sugar/caffeine
/// progress against today's targets, a per-category volume breakdown,
/// and a short recent-logs preview. Derived from
/// [dailyBeverageStreamProvider], [intakeAggregatesProvider], and
/// [userTargetsProvider].

final class DataViewModelProvider
    extends
        $FunctionalProvider<
          DataViewModelState,
          DataViewModelState,
          DataViewModelState
        >
    with $Provider<DataViewModelState> {
  /// Status-dashboard data for the Data Screen: hydration/sugar/caffeine
  /// progress against today's targets, a per-category volume breakdown,
  /// and a short recent-logs preview. Derived from
  /// [dailyBeverageStreamProvider], [intakeAggregatesProvider], and
  /// [userTargetsProvider].
  DataViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataViewModelHash();

  @$internal
  @override
  $ProviderElement<DataViewModelState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DataViewModelState create(Ref ref) {
    return dataViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataViewModelState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataViewModelState>(value),
    );
  }
}

String _$dataViewModelHash() => r'726d1c75dfccfe1ea1f359fc28314ea12c104aa1';
