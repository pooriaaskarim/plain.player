import 'package:isar/isar.dart';

import '../../../pages/settings/models/settings.dart';

// import 'package:path_provider/path_provider.dart';

//
class StorageService {
  ///[StorageService] is a SINGLETON which provides an interface to
  /// [Isar] Storage through [PlainBox] boxes.

  StorageService._() {
    db = openDB();
  }
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._();
  late Future<Isar> db;

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [
          SettingsSchema,
        ],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

// Future<void> saveCourse(Course newCourse) async {
//   final isar = await db;
//   isar.writeTxnSync<int>(() => isar.courses.putSync(newCourse));
// }

// Future<void> saveStudent(Student newStudent) async {
//   final isar = await db;
//   isar.writeTxnSync<int>(() => isar.students.putSync(newStudent));
// }

// Future<void> saveTeacher(Teacher newTeacher) async {
//   final isar = await db;
//   isar.writeTxnSync<int>(() => isar.teachers.putSync(newTeacher));
// }

// Future<List<Course>> getAllCourses() async {
//   final isar = await db;
//   return await isar.courses.where().findAll();
// }

// Stream<List<Course>> listenToCourses() async* {
//   final isar = await db;
//   yield* isar.courses.where().watch(initialReturn: true);
// }
// Future<List<Student>> getStudentsFor(Course course) async {
//   final isar = await db;
//   return await isar.students
//       .filter()
//       .courses((q) => q.idEqualTo(course.id))
//       .findAll();
// }

// Future<Teacher?> getTeacherFor(Course course) async {
//   final isar = await db;

// final teacher = await isar.teachers
//     .filter()
//     .course((q) => q.idEqualTo(course.id))
//     .findFirst();
//
// return teacher;
// }
}
