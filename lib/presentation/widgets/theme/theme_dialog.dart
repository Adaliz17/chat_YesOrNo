import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/theme_provider.dart';

class ThemeDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Theme', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < colorThemes.length; i++)
                ListTile(
                  leading: Icon(Icons.color_lens, color: colorThemes[i]),
                  title: Text(getColorName(i)),
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setTheme(i);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}