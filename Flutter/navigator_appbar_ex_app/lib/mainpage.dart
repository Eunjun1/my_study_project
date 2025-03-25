import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Navigator_AppBar', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () => mailFunction(context, 'send'),
            icon: Icon(Icons.email, color: Colors.white),
          ),
          IconButton(
            onPressed: () => mailFunction(context, 'received'),
            icon: Icon(Icons.email_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => mailFunction(context, 'send'),
              child: Text('보낸 편지함', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => mailFunction(context, 'received'),
              child: Text('받은 편지함', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
            dividerTheme: DividerThemeData(color: Colors.transparent),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                ),
                accountName: Text('pikachu'),
                accountEmail: Text('pikachu@naver.com'),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 181, 51),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.green),
                    title: Text('보낸 편지함'),
                    onTap: () => mailFunction(context, 'send'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined, color: Colors.red),
                    title: Text('받은 편지함'),
                    onTap: () => mailFunction(context, 'received'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  mailFunction(BuildContext context, String part) {
    (part == 'send')
        ? Navigator.pushNamed(context, '/SM')
        : Navigator.pushNamed(context, '/RM');
  }
}
