// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_targets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserTargets)
final userTargetsProvider = UserTargetsProvider._();

final class UserTargetsProvider
    extends $AsyncNotifierProvider<UserTargets, UserProfile> {
  UserTargetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userTargetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userTargetsHash();

  @$internal
  @override
  UserTargets create() => UserTargets();
}

String _$userTargetsHash() => r'ca403ad248636e92c23e31d52f5c7b222e942f42';

abstract class _$UserTargets extends $AsyncNotifier<UserProfile> {
  FutureOr<UserProfile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserProfile>, UserProfile>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserProfile>, UserProfile>,
              AsyncValue<UserProfile>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
