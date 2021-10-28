import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent.fdac46-1.fna.fbcdn.net/v/t1.6435-9/91377100_200665638021976_3330902761893003264_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=e3f864&_nc_ohc=4fap7d8Jg2YAX_ap0NJ&_nc_ht=scontent.fdac46-1.fna&oh=db57dbafd4addcc360c397e889744c7e&oe=61A0CDF3";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Md Parvag Hossain"),
              accountEmail: Text("mdparvagshanto713@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              // currentAccountPicture: Image.network(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
