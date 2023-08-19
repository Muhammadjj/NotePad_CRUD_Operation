class HistoryProvider {
  static const String historyTableName = "History";
  static const String historyColumID = "id";
  static const String historyColumTitle = "title";
  static const String historyColumDescription = "description";
  static const String historyCreateTable =
      """CREATE TABLE $historyTableName($historyColumID INTEGER PRIMARY KEY AUTOINCREMENT,$historyColumTitle TEXT,$historyColumDescription TEXT)""";
}
