import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/drink_log_entry.dart';
import '../services/auth_service.dart';
import '../repositories/firestore_log_repository.dart';
import 'auth_provider.dart';

part 'daily_beverage_stream_provider.g.dart';

/// Streams today's [DrinkLogEntry] list for the signed-in user,
/// filtered to the current day's timestamp boundaries.
@riverpod
Stream<List<DrinkLogEntry>> dailyBeverageStream(Ref ref) {
  final userId =
      ref.watch(authProvider).value?.uid ?? AuthService().currentUserId;

  if (userId == null) {
    return Stream.value(const <DrinkLogEntry>[]);
  }

  final repository = FirestoreLogRepository();
  return repository.streamTodayLogs(userId);
}