import '../database.dart';

class MoodTable extends SupabaseTable<MoodRow> {
  @override
  String get tableName => 'Mood';

  @override
  MoodRow createRow(Map<String, dynamic> data) => MoodRow(data);
}

class MoodRow extends SupabaseDataRow {
  MoodRow(super.data);

  @override
  SupabaseTable get table => MoodTable();

  String get userId => getField<String>('userId')!;
  set userId(String value) => setField<String>('userId', value);

  int get score => getField<int>('score')!;
  set score(int value) => setField<int>('score', value);

  DateTime? get date => getField<DateTime>('Date');
  set date(DateTime? value) => setField<DateTime>('Date', value);

  double? get percent => getField<double>('Percent');
  set percent(double? value) => setField<double>('Percent', value);
}
