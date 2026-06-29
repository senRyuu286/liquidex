import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile.dart';

class UserProfileRepository {
  UserProfileRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<UserProfile?> fetchProfile(String userId) async {
    final snapshot = await _firestore.collection('users').doc(userId).get();
    final data = snapshot.data();
    if (data == null) return null;

    return UserProfile.fromJson({...data, 'id': userId});
  }

  Future<void> saveProfile(UserProfile profile) {
    final json = Map<String, dynamic>.from(profile.toJson())..remove('id');
    return _firestore
        .collection('users')
        .doc(profile.id)
        .set(json, SetOptions(merge: true));
  }
}
