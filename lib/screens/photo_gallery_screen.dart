import 'package:flutter/material.dart';
import 'package:ixora_solution_assignment/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../data/providers/photo_gallery_provider.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PhotoGalleryProvider>(context, listen: false);
    provider.fetchPhotos();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        provider.fetchPhotos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _savePhoto(String imageUrl) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Save image to gallery
      final result = await ImageGallerySaver.saveImage(await fetchImageBytes(imageUrl), quality: 50);
      if (result['isSuccess']) {
        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Photo saved successfully')),
        );
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save photo')),
        );
      }
    } else {
      // Show a message if permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Gallery App'), centerTitle: true),
      body: Consumer<PhotoGalleryProvider>(
        builder: (context, provider, child) {
          if (provider.photos.isEmpty && provider.error == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.error!, style: const TextStyle(fontSize: 16, color: Colors.red)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      provider.clearError();
                      provider.fetchPhotos();
                    },
                    child: const Text('Retry', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: provider.photos.length,
            itemBuilder: (context, index) {
              final photo = provider.photos[index];

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: AspectRatio(
                            aspectRatio: 16 / 8,
                            child: CachedNetworkImage(
                              imageUrl: photo.regularImageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            width: 50, // Adjust the width as needed
                            height: 24, // Adjust the height as needed
                            child: ElevatedButton(
                              onPressed: () => _savePhoto(photo.regularImageUrl),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                              ),
                              child: const Text('Save', style: TextStyle(fontSize: 10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        capitalize(photo.altDescription),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.favorite, color: Colors.red, size: 20),
                              const SizedBox(width: 4),
                              Text(photo.likes.toString(), style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.camera_alt, color: Colors.blueAccent, size: 20),
                              const SizedBox(width: 4),
                              Container(
                                width: 80,
                                child: Text(photo.userName.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
