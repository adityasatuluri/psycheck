// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TextStruct extends FFFirebaseStruct {
  TextStruct({
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        super(firestoreUtilData);

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  static TextStruct fromMap(Map<String, dynamic> data) => TextStruct(
        value: data['value'] as String?,
      );

  static TextStruct? maybeFromMap(dynamic data) =>
      data is Map ? TextStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static TextStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextStruct && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([value]);
}

TextStruct createTextStruct({
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TextStruct(
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TextStruct? updateTextStruct(
  TextStruct? text, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    text
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTextStructData(
  Map<String, dynamic> firestoreData,
  TextStruct? text,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (text == null) {
    return;
  }
  if (text.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && text.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final textData = getTextFirestoreData(text, forFieldValue);
  final nestedData = textData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = text.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTextFirestoreData(
  TextStruct? text, [
  bool forFieldValue = false,
]) {
  if (text == null) {
    return {};
  }
  final firestoreData = mapToFirestore(text.toMap());

  // Add any Firestore field values
  text.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTextListFirestoreData(
  List<TextStruct>? texts,
) =>
    texts?.map((e) => getTextFirestoreData(e, true)).toList() ?? [];
