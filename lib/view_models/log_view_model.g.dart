// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Time-ordered list of today's entries plus a delete action, wired
/// to [LiquidTrackerController] for optimistic swipe-to-delete.

@ProviderFor(LogViewModel)
final logViewModelProvider = LogViewModelProvider._();

/// Time-ordered list of today's entries plus a delete action, wired
/// to [LiquidTrackerController] for optimistic swipe-to-delete.
final class LogViewModelProvider
    extends $NotifierProvider<LogViewModel, LogViewModelState> {
  /// Time-ordered list of today's entries plus a delete action, wired
  /// to [LiquidTrackerController] for optimistic swipe-to-delete.
  LogViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logViewModelHash();

  @$internal
  @override
  LogViewModel create() => LogViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogViewModelState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogViewModelState>(value),
    );
  }
}

String _$logViewModelHash() => r'ea698196311173a40ef150625f5adff92aa6525a';

/// Time-ordered list of today's entries plus a delete action, wired
/// to [LiquidTrackerController] for optimistic swipe-to-delete.

abstract class _$LogViewModel extends $Notifier<LogViewModelState> {
  LogViewModelState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LogViewModelState, LogViewModelState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LogViewModelState, LogViewModelState>,
              LogViewModelState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
