import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(String path, File file) async {
    var ref = _storage.ref().child(path);
    var uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }
}
