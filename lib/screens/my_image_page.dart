import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class MyImagePage extends StatefulWidget {
  const MyImagePage({super.key});

  @override
  _MyImagePageState createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  final List<Size> _imageSizes = [];
  List<String> imagePaths = [];

  Future<void> _getImageSizes() async {
    for (var path in imagePaths) {
      try {
        final file = File(path);
        final bytes = await file.readAsBytes();
        final image = img.decodeImage(bytes);

        setState(() {
          _imageSizes.add(
            Size(image?.width.toDouble() ?? 0, image?.height.toDouble() ?? 0),
          );
        });

        print(
          '$path - Width: ${_imageSizes.last.width}px, Height: ${_imageSizes.last.height}px',
        );
      } catch (e) {
        print('Error loading $path: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getImageSizes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Image Size Checker')),
      body:
          _imageSizes.length == imagePaths.length
              ? ListView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(imagePaths[index], width: 50),
                    title: Text('Image ${index + 1}'),
                    subtitle: Text(
                      'Size: ${_imageSizes[index].width}x${_imageSizes[index].height}',
                    ),
                  );
                },
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
