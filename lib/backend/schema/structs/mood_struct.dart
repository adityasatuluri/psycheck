// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodStruct extends FFFirebaseStruct {
  MoodStruct({
    int? no,
    int? mood,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _no = no,
        _mood = mood,
        super(firestoreUtilData);

  // "no" field.
  int? _no;
  int get no => _no ?? 0;
  set no(int? val) => _no = val;
  void incrementNo(int amount) => _no = no + amount;
  bool hasNo() => _no != null;

  // "mood" field.
  int? _mood;
  int get mood => _mood ?? 0;
  set mood(int? val) => _mood = val;
  void incrementMood(int amount) => _mood = mood + amount;
  bool hasMood() => _mood != null;

  static MoodStruct fromMap(Map<String, dynamic> data) => MoodStruct(
        no: castToType<int>(data['no']),
        mood: castToType<int>(data['mood']),
      );

  static MoodStruct? maybeFromMap(dynamic data) =>
      data is Map ? MoodStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'no': _no,
        'mood': _mood,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'no': serializeParam(
          _no,
          ParamType.int,
        ),
        'mood': serializeParam(
          _mood,
          ParamType.int,
        ),
      }.withoutNulls;

  static MoodStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoodStruct(
        no: deserializeParam(
          data['no'],
          ParamType.int,
          false,
        ),
        mood: deserializeParam(
          data['mood'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MoodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MoodStruct && no == other.no && mood == other.mood;
  }

  @override
  int get hashCode => const ListEquality().hash([no, mood]);
}

MoodStruct createMoodStruct({
  int? no,
  int? mood,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MoodStruct(
      no: no,
      mood: mood,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MoodStruct? updateMoodStruct(
  MoodStruct? moodStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    moodStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMoodStructData(
  Map<String, dynamic> firestoreData,
  MoodStruct? moodStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (moodStruct == null) {
    return;
  }
  if (moodStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && moodStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moodStructData = getMoodFirestoreData(moodStruct, forFieldValue);
  final nestedData = moodStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = moodStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMoodFirestoreData(
  MoodStruct? moodStruct, [
  bool forFieldValue = false,
]) {
  if (moodStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(moodStruct.toMap());

  // Add any Firestore field values
  moodStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMoodListFirestoreData(
  List<MoodStruct>? moodStructs,
) =>
    moodStructs?.map((e) => getMoodFirestoreData(e, true)).toList() ?? [];
