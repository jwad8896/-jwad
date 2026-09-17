import 'package:flutter/material.dart';

void main() {
  runApp(WatsappJwadApp());
}

class WatsappJwadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watsapp Jwad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF008069),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF008069)),
      ),
      home: MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008069),
        title: Text('Watsapp Jwad', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(text: "الدردشات"),
            Tab(text: "الحالات"),
            Tab(text: "الإعدادات"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatsTab(),
          StatusTab(),
          SettingsTab(),
        ],
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          title: Text('صديق تجريبي ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('أهلاً بك في تطبيق واتساب جواد...'),
          trailing: Text('12:00 م', style: TextStyle(color: Colors.grey, fontSize: 12)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomScreen(roomName: 'صديق تجريبي ${index + 1}')));
          },
        );
      },
    );
  }
}

class ChatRoomScreen extends StatelessWidget {
  final String roomName;
  ChatRoomScreen({required this.roomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008069),
        title: Text(roomName, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xFFE5DDD5),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  BubbleMessage(text: "مرحباً جواد، كيف حال التطبيق؟", isMe: false, time: "12:01 م"),
                  BubbleMessage(text: "التطبيق ممتاز ويعمل بشكل رائع مبرمج من قبل جواد!", isMe: true, time: "12:02 م"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          IconButton(icon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey), onPressed: () {}),
                          Expanded(child: TextField(decoration: InputDecoration(hintText: "الرسالة", border: InputBorder.none))),
                          IconButton(icon: Icon(Icons.attach_file, color: Colors.grey), onPressed: () {}), 
                          IconButton(icon: Icon(Icons.camera_alt, color: Colors.grey), onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: Color(0xFF008069),
                    child: Icon(Icons.mic, color: Colors.white), 
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

class BubbleMessage extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  BubbleMessage({required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFFE7FFDB) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('صفحة الحالات اليومية (تختفي بعد 24 ساعة)'));
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('جواد', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('النبذة: مبرمج تطبيق Watsapp Jwad', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          Divider(height: 40),
          ListTile(leading: Icon(Icons.account_circle), title: Text('الحساب')),
          ListTile(leading: Icon(Icons.chat), title: Text('الدردشات')),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.code, color: Color(0xFF008069)),
                SizedBox(width: 10),
                Text('تطوير جواد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF008069))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
