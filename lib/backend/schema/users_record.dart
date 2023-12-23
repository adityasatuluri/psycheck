import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "moodscore" field.
  List<int>? _moodscore;
  List<int> get moodscore => _moodscore ?? const [];
  bool hasMoodscore() => _moodscore != null;

  // "totmood" field.
  double? _totmood;
  double get totmood => _totmood ?? 0.0;
  bool hasTotmood() => _totmood != null;

  // "curmood" field.
  int? _curmood;
  int get curmood => _curmood ?? 0;
  bool hasCurmood() => _curmood != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "days" field.
  List<DateTime>? _days;
  List<DateTime> get days => _days ?? const [];
  bool hasDays() => _days != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "gad7" field.
  double? _gad7;
  double get gad7 => _gad7 ?? 0.0;
  bool hasGad7() => _gad7 != null;

  // "phq9" field.
  double? _phq9;
  double get phq9 => _phq9 ?? 0.0;
  bool hasPhq9() => _phq9 != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _moodscore = getDataList(snapshotData['moodscore']);
    _totmood = castToType<double>(snapshotData['totmood']);
    _curmood = castToType<int>(snapshotData['curmood']);
    _count = castToType<int>(snapshotData['count']);
    _days = getDataList(snapshotData['days']);
    _role = snapshotData['role'] as String?;
    _gad7 = castToType<double>(snapshotData['gad7']);
    _phq9 = castToType<double>(snapshotData['phq9']);
    _rate = castToType<double>(snapshotData['rate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? totmood,
  int? curmood,
  int? count,
  String? role,
  double? gad7,
  double? phq9,
  double? rate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'totmood': totmood,
      'curmood': curmood,
      'count': count,
      'role': role,
      'gad7': gad7,
      'phq9': phq9,
      'rate': rate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.moodscore, e2?.moodscore) &&
        e1?.totmood == e2?.totmood &&
        e1?.curmood == e2?.curmood &&
        e1?.count == e2?.count &&
        listEquality.equals(e1?.days, e2?.days) &&
        e1?.role == e2?.role &&
        e1?.gad7 == e2?.gad7 &&
        e1?.phq9 == e2?.phq9 &&
        e1?.rate == e2?.rate;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.moodscore,
        e?.totmood,
        e?.curmood,
        e?.count,
        e?.days,
        e?.role,
        e?.gad7,
        e?.phq9,
        e?.rate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
