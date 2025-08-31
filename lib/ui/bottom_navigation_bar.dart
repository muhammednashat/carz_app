import 'package:carz_app/ui/favorires.dart/favorites.dart';
import 'package:carz_app/ui/main/main_screen.dart';
import 'package:carz_app/ui/profile/profile.dart';
import 'package:flutter/material.dart';

class AppBottomTabBar extends StatefulWidget {
  const AppBottomTabBar({super.key});

  @override
  State<AppBottomTabBar> createState() => _AppBottomTabBarState();
}

final _screens =[
   MainScreen(),
   FavoritesScreen(),
   ProfileScreen(),
];

class _AppBottomTabBarState extends State<AppBottomTabBar> {

  var _selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: SafeArea(child:_screens[_selectedScreen] ,),
     bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreen,
          onTap: (index){
            setState(() {
              _selectedScreen = index;
            });
          },
         items: [
          BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined) , label: "Profile"),
         ],
     ),

    );
  }
}