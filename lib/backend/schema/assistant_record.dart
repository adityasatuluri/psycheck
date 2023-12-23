import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AssistantRecord extends FirestoreRecord {
  AssistantRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _uid = snapshotData['uid'] as String?;
    _done = snapshotData['done'] as bool?;
    _response = snapshotData['response'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('assistant');

  static Stream<AssistantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssistantRecord.fromSnapshot(s));

  static Future<AssistantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssistantRecord.fromSnapshot(s));

  static AssistantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AssistantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssistantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssistantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssistantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssistantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssistantRecordData({
  String? message,
  String? uid,
  bool? done,
  String? response,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'uid': uid,
      'done': done,
      'response': response,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssistantRecordDocumentEquality implements Equality<AssistantRecord> {
  const AssistantRecordDocumentEquality();

  @override
  bool equals(AssistantRecord? e1, AssistantRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.uid == e2?.uid &&
        e1?.done == e2?.done &&
        e1?.response == e2?.response;
  }

  @override
  int hash(AssistantRecord? e) =>
      const ListEquality().hash([e?.message, e?.uid, e?.done, e?.response]);

  @override
  bool isValidKey(Object? o) => o is AssistantRecord;
}
