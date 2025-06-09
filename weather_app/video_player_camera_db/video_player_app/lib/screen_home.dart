import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'db.dart';
import 'video_player_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final ImagePicker _picker = ImagePicker();
  List<String> videoPaths = [];

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    setState(() {
      videoPaths = VideoDatabase.getVideos() as List<String>;
    });
  }

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _saveVideo(video.path);
    }
  }

  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      _saveVideo(video.path);
    }
  }

  //to save video

  void _saveVideo(String path) async {
    if (!videoPaths.contains(path)) {
      videoPaths.add(path);
      await VideoDatabase.addVideo(path);
      setState(() {
        videoPaths = VideoDatabase.getVideos() as List<String>;
      });
    }
  }

  void _deleteVideo(int index) async {
    setState(() {
      videoPaths.removeAt(index);
    });
    await VideoDatabase.deleteVideo(index);
    _loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text(
          'Video Player',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(videoPaths[index]),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              _deleteVideo(index); // Delete video at specific index
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Video deleted')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text("Video ${index + 1}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoPlayerScreen(videoPath: videoPaths[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOptions(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }

  //options
  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Record Video'),
              onTap: () {
                Navigator.pop(context);
                _recordVideo();
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_copy),
              title: const Text('Pick from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickVideo();
              },
            ),
          ],
        );
      },
    );
  }
}
