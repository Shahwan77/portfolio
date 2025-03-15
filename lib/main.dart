import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage()
    );
  }
}


class HomePage extends StatelessWidget {
  final List<Project> projects = [
    Project(name: 'Project 1', image: 'https://placeimg.com/400/300/tech'),
    Project(name: 'Project 2', image: 'https://placeimg.com/400/300/tech'),
    Project(name: 'Project 3', image: 'https://placeimg.com/400/300/tech'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shahwan's Portfolio"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Introduction Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('https://placeimg.com/200/200/people'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hello, I\'m Shahwan Bin Shaj!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Flutter Developer | Mobile App Enthusiast',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),

            // About Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Me', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'I am a Flutter developer with a passion for building mobile applications. I have experience creating robust and scalable apps. I am always excited to learn new technologies and explore more about mobile development.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Projects Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Projects', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Image.network(projects[index].image, height: 150, width: 150, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(projects[index].name, style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Contact Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Me', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'Feel free to reach out to me via email at: shahwan@example.com',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add email functionality
                    },
                    child: Text('Send Email'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String name;
  final String image;

  Project({required this.name, required this.image});
}