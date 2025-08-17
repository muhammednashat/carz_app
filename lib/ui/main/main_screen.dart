import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0),
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(getImagePath("user.png")),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text.rich(
                      TextSpan(
                        text: "Hello, Mohammed",
                        children: [TextSpan(text: "👋")],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),

                Text('Let\'s find your favourite car here'),
                SizedBox(height: 8.0),

                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: 50.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_alt),
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.0),
                ItemRow(title: 'Trending Brands'),
                 
                SizedBox(height: 24.0),
                ItemRow(title: 'Pupolar Car'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text('view all')],
    );
  }
}
