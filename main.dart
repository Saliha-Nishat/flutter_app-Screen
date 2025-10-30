import 'package:flutter/material.dart';

void main() {
  runApp(MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: WelcomeScreen(),
      routes: {
        '/profile': (context) => ProfileScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}

// -------------------------------------------------------------
// 🌸 Screen 1: Welcome Screen
// -------------------------------------------------------------
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to My Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Text('View Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// 👤 Screen 2: Profile Screen
// -------------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  final String profileImage = 'assets/profile.jpg'; // Add this image in assets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        child: Icon(Icons.info_outline),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: 16),
            Text(
              'Saliha Nishad',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
            SizedBox(height: 10),
            Text(
              'A passionate Flutter learner who loves building beautiful and functional apps.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: const [
                    InfoCard(icon: Icons.email, text: 'saliha@example.com'),
                    InfoCard(icon: Icons.phone, text: '+92 300 1234567'),
                    InfoCard(icon: Icons.location_on, text: 'Gilgit, Pakistan'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IconButton(onPressed: null, icon: Icon(Icons.link)),
                IconButton(onPressed: null, icon: Icon(Icons.code)),
                IconButton(onPressed: null, icon: Icon(Icons.alternate_email)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// 📇 InfoCard Widget (Reusable)
// -------------------------------------------------------------
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// 📘 Screen 3: About Me Page
// -------------------------------------------------------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Education',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('BS Computer Science, Karakoram International University'),
          SizedBox(height: 20),
          Text('Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Flutter')),
              Chip(label: Text('Dart')),
              Chip(label: Text('UI Design')),
              Chip(label: Text('GitHub')),
            ],
          ),
          SizedBox(height: 20),
          Text('Hobbies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
              'Reading, Learning new technologies, Exploring nature, and Designing.'),
        ],
      ),
    );
  }
}
