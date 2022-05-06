import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_fridge/pages/Account/login_page.dart';
import 'package:the_fridge/pages/Home/home_page.dart';

class PreservingBottomNavState extends StatefulWidget {
  const PreservingBottomNavState({Key? key}) : super(key: key);

  @override
  _PreservingBottomNavStateState createState() =>
      _PreservingBottomNavStateState();
}

class _PreservingBottomNavStateState extends State<PreservingBottomNavState> {
  int _selectedIndex = 1;

  static final List<Widget> _pages = <Widget>[
    LoginPage(),
    const HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        //color: isDark == true ? Colors.black : Colors.white,
        backgroundColor: Colors.blue,
        height: 45.5,
        items: const <Widget>[
          Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            color: Colors.black,
          ),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:the_fridge/pages/Account/account_page.dart';
// import 'package:the_fridge/pages/Home/home_page.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({Key? key}) : super(key: key);
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   var currentTab = [
//     HomePage(),
//     AccountPage(),
//   ];
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: currentTab,
//       ),
//       bottomNavigationBar: 
// CurvedNavigationBar(
//         animationDuration: const Duration(milliseconds: 400),
//         //color: isDark == true ? Colors.black : Colors.white,
//         backgroundColor: Colors.blue,
//         height: 45.5,
//         items: const <Widget>[
//           Icon(
//             Icons.account_circle_rounded,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.home,
//             color: Colors.black,
//           ),
//         ],
//         index: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
