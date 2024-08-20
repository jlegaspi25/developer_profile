import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          const ProfilePage(), // Replace ProfilePage with your actual page widget.
      title: 'Developer Profile',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2706445229.
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _launchURL(Uri url) async {
    // if (await canLaunchUrl(url)) {
    await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Profile'),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: const EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(148),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 60,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Transform.scale(
                    scale: 1.6,
                    child: const CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/Profile.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    _launchURL(
                      Uri(scheme: 'mailto', path: 'example@example.com'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.web),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://linkedin.com'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.code),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://github.com'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://facebook.com'),
                    );
                  },
                ),
              ],
            ),
            const Text(
              '"I just want you to know who I am."',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
