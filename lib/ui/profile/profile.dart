import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Profile", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 32.0),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  getImagePath('user.png'),
                  height: 70.0,
                  width: 70.0,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Center(
              child: Text(
                'Mohammed Nashat',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemDocumentation(
                  title: "Passport",
                  icon: Icons.card_travel,
                  onTap: () {},
                ),
                ItemDocumentation(
                  title: "Contract",
                  icon: Icons.description,
                  onTap: () {},
                ),
                ItemDocumentation(
                  title: "License",
                  icon: Icons.card_membership,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 48.0),
            ItemRow(title: 'My Profile', icon: Icons.person, onTap: () {}),
            ItemRow(title: 'My Booking', icon: Icons.bookmarks, onTap: () {}),
            ItemRow(title: 'Settings', icon: Icons.settings, onTap: () {}),
            SizedBox(height: 24.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  onPressed: () {},
                  text: "Edit Profile",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 25.0),
        ),
      ),
    );
  }
}

class ItemDocumentation extends StatelessWidget {
  const ItemDocumentation({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Icon(icon, size: 35.0),
              SizedBox(height: 8.0),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
