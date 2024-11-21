// import 'package:path/path.dart';
// import 'package:pool/models/expense.dart';
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   static Future<Database> database() async {
//     final dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'expenses.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE expenses(id TEXT PRIMARY KEY, title TEXT, amount REAL, date TEXT, catagory TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   static Future<void> insertExpense(Expense expense) async {
//     final db = await DBHelper.database();
//     await db.insert(
//       'expenses',
//       expense.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   static Future<List<Expense>> fetchExpenses() async {
//     final db = await DBHelper.database();
//     final List<Map<String, dynamic>> maps = await db.query('expenses');
//     return List.generate(maps.length, (i) {
//       return Expense(
//         id: maps[i]['id'],
//         title: maps[i]['title'],
//         amount: maps[i]['amount'],
//         date: DateTime.parse(maps[i]['date']),
//         catagory: Category.values
//             .firstWhere((cat) => cat.toString() == maps[i]['catagory']),
//       );
//     });
//   }

//   static Future<void> deleteExpense(String id) async {
//     final db = await DBHelper.database();
//     await db.delete(
//       'expenses',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }
