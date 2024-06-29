import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  final ImagePicker picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> getImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Photo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Upload functionality goes here
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}
