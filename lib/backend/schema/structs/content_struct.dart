// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContentStruct extends FFFirebaseStruct {
  ContentStruct({
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static ContentStruct fromMap(Map<String, dynamic> data) => ContentStruct(
        type: data['type'] as String?,
      );

  static ContentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentStruct && type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([type]);
}

ContentStruct createContentStruct({
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentStruct(
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentStruct? updateContentStruct(
  ContentStruct? content, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    content
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentStructData(
  Map<String, dynamic> firestoreData,
  ContentStruct? content,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (content == null) {
    return;
  }
  if (content.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && content.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentData = getContentFirestoreData(content, forFieldValue);
  final nestedData = contentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = content.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentFirestoreData(
  ContentStruct? content, [
  bool forFieldValue = false,
]) {
  if (content == null) {
    return {};
  }
  final firestoreData = mapToFirestore(content.toMap());

  // Add any Firestore field values
  content.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentListFirestoreData(
  List<ContentStruct>? contents,
) =>
    contents?.map((e) => getContentFirestoreData(e, true)).toList() ?? [];
