import 'package:flutter/material.dart';

void main() {
  runApp(MyCreativeProfileApp());
}

class MyCreativeProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('img/profile-picture.jpeg'),
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 5),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Naufal Aflakh Wijayanto',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Follow', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Bio Card
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Me',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Hello! I am a passionate Flutter developer with a love for building beautiful and functional applications.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Info Cards
                        profileInfoCard(
                          icon: Icons.person,
                          title: 'Nama Lengkap',
                          subtitle: 'Naufal Aflakh Wijayanto',
                          iconColor: Colors.teal,
                        ),
                        profileInfoCard(
                          icon: Icons.male,
                          title: 'Jenis Kelamin',
                          subtitle: 'Laki - Laki',
                          iconColor: Colors.teal,
                        ),
                        profileInfoCard(
                          icon: Icons.badge,
                          title: 'NIM',
                          subtitle: '2211104073',
                          iconColor: Colors.teal,
                        ),
                        profileInfoCard(
                          icon: Icons.email,
                          title: 'Email',
                          subtitle: 'kopet233119@gmail.com',
                          iconColor: Colors.teal,
                        ),
                        profileInfoCard(
                          icon: Icons.school,
                          title: 'Universitas',
                          subtitle: 'Universitas Telkom Purwokerto',
                          iconColor: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfoCard({required IconData icon, required String title, required String subtitle, required Color iconColor}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
