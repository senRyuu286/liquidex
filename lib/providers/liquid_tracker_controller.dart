import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/drink_log_entry.dart';
import '../services/auth_service.dart';
import '../repositories/firestore_log_repository.dart';
import 'auth_provider.dart';
import 'daily_beverage_stream_provider.dart';

part 'liquid_tracker_controller.g.dart';

@riverpod
class LiquidTrackerController extends _$LiquidTrackerController {
  final FirestoreLogRepository _repository = FirestoreLogRepository();
  final AuthService _authService = AuthService();

  @override
  List<DrinkLogEntry> build() {
    return ref.watch(dailyBeverageStreamProvider).value ?? const [];
  }

  String? get _userId =>
      ref.read(authProvider).value?.uid ?? _authService.currentUserId;

  Future<void> addEntry(DrinkLogEntry entry) async {
    final userId = _userId;
    if (userId == null) {
      throw StateError('Cannot add entry: no signed-in user.');
    }

    final previous = state;
    state = [...state, entry];

    try {
      await _repository.writeLog(userId, entry);
    } catch (_) {
      state = previous;
      rethrow;
    }
  }

  Future<void> deleteEntry(String uuid) async {
    final userId = _userId;
    if (userId == null) {
      throw StateError('Cannot delete entry: no signed-in user.');
    }

    final previous = state;
    state = state.where((e) => e.id != uuid).toList();

    try {
      await _repository.deleteLog(userId, uuid);
    } catch (_) {
      state = previous;
      rethrow;
    }
  }
}
