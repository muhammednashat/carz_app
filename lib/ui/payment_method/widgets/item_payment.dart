
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/utils/util_funcs.dart';
import 'package:flutter/material.dart';

class ItemPayment extends StatelessWidget {
  const ItemPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: AppTheme.accent,
        child: ListTile(
          title:      Text('1234 1452 8566 9854'),
          subtitle:      Text('Mohammed Nashat'),
          trailing: Image.asset(getIconPath('visa_card.png'), height: 35.0,width: 35.0,),
          
        )
      ),
    );
  }
}