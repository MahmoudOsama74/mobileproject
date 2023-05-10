import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onPressed;

  BookmarkButton({
    required this.isBookmarked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: Colors.blue,
      ),
      onPressed: onPressed,
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final bool isBookmarked;

  FavoriteScreen({required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
      ),
      body: Center(
        child: Text(
          'Bookmarked: $isBookmarked',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void navigateToFavoriteScreen(BuildContext context, bool isBookmarked) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoriteScreen(isBookmarked: isBookmarked),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookmarkButton(
              isBookmarked: isBookmarked,
              onPressed: () {
                isBookmarked = !isBookmarked;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                navigateToFavoriteScreen(context, isBookmarked);
              },
              child: Text('Go to Favorite Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmark Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
