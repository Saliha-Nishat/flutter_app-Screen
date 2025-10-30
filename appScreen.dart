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
      ),
      home: HomeScreen(),
    );
  }
}

// 🟢 Screen 1: Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to My Profile",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black38, blurRadius: 3),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.person, color: Colors.white),
              label: const Text(
                "View My Profile",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 🟢 Screen 2: Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage('assets/profile.jpg'), // optional image
            ),
            const SizedBox(height: 20),

            // 🩵 Your Name and Profession
            const Text(
              "Saliha Nishad",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),

            // 📝 Short Bio Section
            const Text(
              "I’m an aspiring Flutter developer who loves learning new technologies and creating simple, elegant apps. Passionate about design, learning, and continuous growth.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
            ),

            const SizedBox(height: 20),

            // 📨 Contact Details
            Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.teal),
                title: const Text("saliha@example.com"),
              ),
            ),
            Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.teal),
                title: const Text("+92 300 1234567"),
              ),
            ),
            Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.teal),
                title: const Text("Gilgit, Pakistan"),
              ),
            ),

            const SizedBox(height: 20),

            // 🔗 Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.link, color: Colors.teal, size: 30),
                SizedBox(width: 15),
                Icon(Icons.code, color: Colors.teal, size: 30),
                SizedBox(width: 15),
                Icon(Icons.alternate_email, color: Colors.teal, size: 30),
              ],
            ),

            const SizedBox(height: 80), // space for FAB visibility
          ],
        ),
      ),

      // 🟢 Floating Action Button (Visible and working)
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal.shade700,
        icon: const Icon(Icons.info_outline, color: Colors.white),
        label: const Text(
          "About Me",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutMeScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// 🟢 Screen 3: About Me Screen
class AboutMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me"),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Hello! I'm Saliha Nishad — a student and Flutter enthusiast from Gilgit, Pakistan. "
            "I enjoy building creative, functional apps and exploring new ideas in technology.",
            style: TextStyle(fontSize: 16, height: 1.6),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
