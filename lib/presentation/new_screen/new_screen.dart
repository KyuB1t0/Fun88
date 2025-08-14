import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  final String searchQuery;
  final List<String> images; // Receive images from parent

  const NewScreen({super.key, required this.images, required this.searchQuery});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late List<bool> bookmarkedList;

  @override
  void initState() {
    super.initState();
    bookmarkedList = List.filled(widget.images.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final filteredImages = widget.images.where((img) {
      final fileName = img.split('/').last.split('.').first.toLowerCase();
      return fileName.contains(widget.searchQuery.toLowerCase());
    }).toList();

    if (filteredImages.isEmpty) {
      return const Center(
        child: Text("No games found", style: TextStyle(color: Colors.grey)),
      );
    }
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(widget.images.length, (index) {
        final imagePath = widget.images[index];
        final isBookmarked = bookmarkedList[index];

        return SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        bookmarkedList[index] = !bookmarkedList[index];
                      });
                    },
                    child: ClipPath(
                      clipper: _CornerClipper(),
                      child: Container(
                        color: Colors.brown,
                        width: 30,
                        height: 30,
                        child: Align(
                          alignment: const Alignment(0.65, -0.65),
                          child: Icon(
                            isBookmarked ? Icons.star : Icons.star_border,
                            color: isBookmarked ? Colors.yellow : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
