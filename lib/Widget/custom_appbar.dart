import 'package:flutter/material.dart';
import 'app_bar_gradient.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Todo List",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      //toolbarHeight: 250,
      centerTitle: true,
      flexibleSpace: const AppBarGradient(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: TabBar(tabs: [
        //Tab(child: Text('All',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        Tab(child: Text('Personal',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        Tab(child: Text('Work',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
