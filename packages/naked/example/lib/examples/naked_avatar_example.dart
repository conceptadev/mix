import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

class NakedAvatarExample extends StatefulWidget {
  const NakedAvatarExample({super.key});

  @override
  State<NakedAvatarExample> createState() => _NakedAvatarExampleState();
}

class _NakedAvatarExampleState extends State<NakedAvatarExample> {
  // Update base URL back to pravatar.cc
  final String _baseUrl = 'https://i.pravatar.cc';
  int _imageIndex = 0;

  void _refreshAvatar() {
    setState(() {
      _imageIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Construct the URL for the main avatar (size 100)
    final imageUrl = '$_baseUrl/100?img=$_imageIndex';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildSectionTitle('Basic Avatar'),
            NakedAvatar(
              image: NetworkImage(imageUrl),
              imageWidgetBuilder: (context, image) => Container(
                height: 200,
                width: 200,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'AB',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    image!,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              key: const ValueKey('refresh_avatar_button'),
              icon: const Icon(Icons.refresh),
              label: const Text('Load New Avatar'),
              onPressed: _refreshAvatar,
            ),
            const SizedBox(height: 40),
            _buildSectionTitle('Avatar with Fallback'),
            NakedAvatar(
              // size: 80,
              // image: const NetworkImage('https://invalid-url-for-testing.xyz'),
              imageWidgetBuilder: (BuildContext context, Widget? widget) =>
                  Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  'AB',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildSectionTitle('Avatar Group'),
            // Use Stack for safe overlapping
            SizedBox(
              // Define height for the Stack based on avatar size
              height: 50,
              // Calculate approximate width needed for the group
              width: 50.0 * 3 -
                  (8.0 * 2), // (Avatar width * count) - (overlap * (count - 1))
              child: Stack(
                children: List.generate(3, (index) {
                  final groupImageUrl =
                      '$_baseUrl/50?img=${_imageIndex + index}';
                  // Calculate left position for each avatar
                  final double leftPosition =
                      index * (50.0 - 16.0); // Avatar width - overlap * 2

                  return Positioned(
                    left: leftPosition,
                    top: 0,
                    child: NakedAvatar(
                      image: NetworkImage(groupImageUrl),
                      imageWidgetBuilder: (context, image) => Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            width: 3,
                          ), // White border
                          color: Colors.purple.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: image,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
            _buildSectionTitle('Different Sizes'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [40.0, 60.0, 80.0].map((size) {
                // Construct URL for sized avatars
                final sizedImageUrl = '$_baseUrl/${size.toInt()}';
                return Column(
                  children: [
                    NakedAvatar(
                      image: NetworkImage(sizedImageUrl),
                      imageWidgetBuilder: (context, image) => Container(
                        height: size,
                        width: size,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: image,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('${size.toInt()}px',
                        style: const TextStyle(fontSize: 12)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
