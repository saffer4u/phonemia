import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final storageInstance = FirebaseStorage.instance;

  // Upload file..
  Future<String?> uploadFile({
    required String folderName,
    required String filePath,
    required String fileName,
  }) async {
    File file = File(filePath);
    try {
      final uploadRes =
          await storageInstance.ref('$folderName/$fileName').putFile(file);
      return await storageInstance
          .ref(uploadRes.metadata!.fullPath)
          .getDownloadURL();
    } on FirebaseException {
      // print("Upload Error : ${e.toString()}");
      return null;
    }
  }
}
