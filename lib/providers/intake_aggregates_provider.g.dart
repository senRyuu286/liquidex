// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intake_aggregates_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(intakeAggregates)
final intakeAggregatesProvider = IntakeAggregatesProvider._();

final class IntakeAggregatesProvider
    extends
        $FunctionalProvider<
          IntakeAggregates,
          IntakeAggregates,
          IntakeAggregates
        >
    with $Provider<IntakeAggregates> {
  IntakeAggregatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'intakeAggregatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$intakeAggregatesHash();

  @$internal
  @override
  $ProviderElement<IntakeAggregates> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IntakeAggregates create(Ref ref) {
    return intakeAggregates(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IntakeAggregates value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IntakeAggregates>(value),
    );
  }
}

String _$intakeAggregatesHash() => r'ac18a6618e294dd0afb0ca9f535a1c026ab1a7e1';
