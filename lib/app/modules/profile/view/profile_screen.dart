import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("assets/icons/profile/user.png"),
            title: Text("Name"),
            subtitle: Text("Akash Rawat"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/call.png"),
            title: Text("Mobile Number"),
            subtitle: Text("+91 123 456 7890"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/mail.png"),
            title: Text("Email"),
            subtitle: Text("akashrawat000@gmail.com"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/calendar.png"),
            title: Text("Date of Birth"),
            subtitle: Text("15-02-2000"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/gender.png"),
            title: Text("Gender"),
            subtitle: Text("Male"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/member.png"),
            title: Text("Member Since"),
            subtitle: Text("25 June 2024"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/language.png"),
            title: Text("Language"),
            subtitle: Text("English"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("assets/icons/profile/delete_ac.png"),
            title: Text("Delete Account"),
            trailing: Image.asset("assets/icons/profile/bucket_red.png"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
