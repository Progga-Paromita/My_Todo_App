import 'package:flutter/cupertino.dart';
import 'package:my_todo_app/theme/color_pallete/pallete.dart';

class AppBarGradient extends StatelessWidget {
  const AppBarGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Pallete.gradient1,
          Pallete.gradient2,
          Pallete.gradient3
        ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )
      ),
    );
  }
}
