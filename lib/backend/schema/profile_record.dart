import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profile')
          : FirebaseFirestore.instance.collectionGroup('profile');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('profile').doc();

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    return e1?.id == e2?.id;
  }

  @override
  int hash(ProfileRecord? e) => const ListEquality().hash([e?.id]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
