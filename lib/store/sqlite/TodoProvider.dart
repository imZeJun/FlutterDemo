import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todo {

  int id;
  String title;
  bool done;

  Todo({this.id, this.title, this.done});

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[TodoProvider.TABLE_COLUMN_ID];
    title = map[TodoProvider.TABLE_COLUMN_TITLE];
    done = map[TodoProvider.TABLE_COLUMN_DONE] == 1;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      TodoProvider.TABLE_COLUMN_TITLE : title,
      TodoProvider.TABLE_COLUMN_DONE : done ? 1 : 0};
    if (id != null) {
      map[TodoProvider.TABLE_COLUMN_ID] = id;
    }
    return map;
  }
}

class TodoProvider {

  static TodoProvider _instance;

  TodoProvider._internal();

  static TodoProvider _getInstance() {
    if (_instance == null) {
      _instance = TodoProvider._internal();
    }
    return _instance;
  }

  factory TodoProvider() => _getInstance();
  static TodoProvider get instance => _getInstance();

  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;

  static const TABLE_CREATE = 'CREATE TABLE $TABLE_NAME ('
      '$TABLE_COLUMN_ID INTEGER PRIMARY KEY, '
      '$TABLE_COLUMN_TITLE TEXT, '
      '$TABLE_COLUMN_DONE INTEGER)';
  static const TABLE_NAME = "todo";
  static const TABLE_COLUMN_ID = "_id";
  static const TABLE_COLUMN_TITLE = "title";
  static const TABLE_COLUMN_DONE = "done";

  Database _db;

  Future<Database> _getDb() async {
    return _db ??= await _open();
  }

  _open() async {
    String p = await getDatabasesPath();
    String path = join(p, DB_NAME);
    _db = await openDatabase(path, version: DB_VERSION,
        onCreate: _create,
        onUpgrade: _upgrade
    );
    print('_init');
    return _db;
  }

  _create(Database db, int version) async {
    print('_create, version=$version');
    await db.execute(TABLE_CREATE);
  }

  _upgrade(Database db, int oldVersion, int newVersion) async {
    print('_upgrade, oldVersion=$oldVersion, newVersion=$newVersion');
  }

  Future<Todo> insertTodo(Todo todo) async {
    var server = await _getDb();
    todo.id = await server.insert(TABLE_NAME, todo.toMap());
    return todo;
  }

  Future<Todo> queryTodo(int id) async {
    var server = await _getDb();
    List<Map> maps = await server.query(TABLE_NAME,
      columns: [TABLE_COLUMN_ID, TABLE_COLUMN_TITLE, TABLE_COLUMN_DONE],
      where: '$TABLE_COLUMN_ID = ?',
      whereArgs: [id]);
    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteTodo(int id) async {
    var server = await _getDb();
    return await server.delete(TABLE_NAME,
        where: '$TABLE_COLUMN_ID = ?',
        whereArgs: [id]);
  }

  Future<int> updateTodo(Todo todo) async {
    var server = await _getDb();
    return await server.update(TABLE_NAME,
        todo.toMap(),
        where: '$TABLE_COLUMN_ID = ?',
        whereArgs: [todo.id]);
  }

}