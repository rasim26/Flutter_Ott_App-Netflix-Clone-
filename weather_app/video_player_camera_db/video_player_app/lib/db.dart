// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';

// class VideoDatabase {
//   static const String _box = 'Folder';
//   static Future<void> initHive() async {
//     await Hive.openBox<List<String>>(_box);
//   }
//   //to save a video.
//   static Future<void> addVideo(String videoPath) async {
//     var box = Hive.box<List<String>>(_box);
//     List<String> currentVideos = box.get('videos', defaultValue: []) ?? [];
//     currentVideos.add(videoPath);
//     await box.put('videos', currentVideos);
//   }

//   //to list the videos.
//   static List<String> getVideos() {
//     var box = Hive.box<List<String>>(_box);
//     return box.get('videos', defaultValue: []) ?? [];
//   }

//   //delete
//   static Future<void> deleteVideo(int index) async {
//     var box = Hive.box<List<String>>(_box);
//     List<String> currentVideos = box.get('videos', defaultValue: []) ?? [];
//     currentVideos.removeAt(index);
//     await box.put('videos', currentVideos);
//   }

//   // static Future<void> clearAll() async {
//   //   var box = Hive.box<List<String>>(_boxName);
//   //   await box.delete('videos');
//   // }
// }

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class VideoDatabase {
  static const String _box = 'Gallery';

  // Initialize Hive
  static Future<void> initHive() async {
    await Hive.openBox<String>(_box);
  }

  static Future<void> addVideo(String videoPath) async {
    var box = Hive.box<String>(_box);
    String unikey = DateTime.now().millisecondsSinceEpoch.toString();
    await box.put(unikey, videoPath);
  }

  // List all videos
  static Map<String, String> getVideos() {
    var box = Hive.box<String>(_box);
    return box.toMap().cast<String, String>(); // Return all key-value pairs
  }

  // Delete
  static Future<void> deleteVideo(int key) async {
    var box = Hive.box<String>(_box);
    await box.delete(key);
  }
}
