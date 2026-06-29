import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/drink_log_entry.dart';

class FirestoreLogRepository {
  FirestoreLogRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _logsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('drinkLogs');
  }

  Future<void> writeLog(String userId, DrinkLogEntry entry) {
    return _logsCollection(userId).doc(entry.id).set(entry.toJson());
  }

  Stream<List<DrinkLogEntry>> streamTodayLogs(String userId) {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final startOfNextDay = startOfDay.add(const Duration(days: 1));

    return _logsCollection(userId)
        .where(
          'timestamp',
          isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
        )
        .where('timestamp', isLessThan: Timestamp.fromDate(startOfNextDay))
        .orderBy('timestamp')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => DrinkLogEntry.fromJson(doc.data()))
              .toList(),
        );
  }

  Future<void> deleteLog(String userId, String uuid) {
    return _logsCollection(userId).doc(uuid).delete();
  }
}
