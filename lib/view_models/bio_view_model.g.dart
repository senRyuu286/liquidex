// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bio_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BioViewModel)
final bioViewModelProvider = BioViewModelProvider._();

final class BioViewModelProvider
    extends $NotifierProvider<BioViewModel, BioViewModelState> {
  BioViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bioViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bioViewModelHash();

  @$internal
  @override
  BioViewModel create() => BioViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BioViewModelState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BioViewModelState>(value),
    );
  }
}

String _$bioViewModelHash() => r'dd5709acfb329c84fe6d72f3701d5bf40603f47a';

abstract class _$BioViewModel extends $Notifier<BioViewModelState> {
  BioViewModelState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BioViewModelState, BioViewModelState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BioViewModelState, BioViewModelState>,
              BioViewModelState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
