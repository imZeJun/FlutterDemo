import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtil {

  static Future<File> writePrivateFile(String path, String value) async {
    Directory baseDir = await getTemporaryDirectory();
    File targetFile = await createTargetFile(baseDir, path);
    if (await targetFile?.exists()) {
      return targetFile.writeAsString(value);
    }
    return null;
  }

  static Future<File> writeExternalFile(String path, String value) async {
    Directory baseDir = await getExternalStorageDirectory();
    File targetFile = await createTargetFile(baseDir, path);
    if (await targetFile?.exists()) {
      return targetFile.writeAsString(value);
    }
    return null;
  }

  static Future<String> readPrivateFile(String path) async {
    Directory baseDir = await getTemporaryDirectory();
    File targetFile = await createTargetFile(baseDir, path);
    if (await targetFile?.exists()) {
      return targetFile.readAsString();
    }
    return null;
  }

  static Future<File> createTargetFile(Directory parent, String filePath) async {
    if (filePath == null) {
      return null;
    }
    File newFile = File("${parent.path}/$filePath");
    if (!await newFile.exists()) {
      newFile = await newFile.create(recursive: true);
    }
    return newFile;
  }
}