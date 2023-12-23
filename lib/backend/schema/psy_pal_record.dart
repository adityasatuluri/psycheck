import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PsyPalRecord extends FirestoreRecord {
  PsyPalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idd" field.
  String? _idd;
  String get idd => _idd ?? '';
  bool hasIdd() => _idd != null;

  void _initializeFields() {
    _idd = snapshotData['idd'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PsyPal');

  static Stream<PsyPalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PsyPalRecord.fromSnapshot(s));

  static Future<PsyPalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PsyPalRecord.fromSnapshot(s));

  static PsyPalRecord fromSnapshot(DocumentSnapshot snapshot) => PsyPalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsyPalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsyPalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsyPalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PsyPalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPsyPalRecordData({
  String? idd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idd': idd,
    }.withoutNulls,
  );

  return firestoreData;
}

class PsyPalRecordDocumentEquality implements Equality<PsyPalRecord> {
  const PsyPalRecordDocumentEquality();

  @override
  bool equals(PsyPalRecord? e1, PsyPalRecord? e2) {
    return e1?.idd == e2?.idd;
  }

  @override
  int hash(PsyPalRecord? e) => const ListEquality().hash([e?.idd]);

  @override
  bool isValidKey(Object? o) => o is PsyPalRecord;
}
