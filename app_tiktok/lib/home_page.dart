import 'package:app_tiktok/my_shop.dart';
import 'package:app_tiktok/tiktok_profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String accessToken;
  const HomePage({super.key, required this.accessToken});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Text("data"),
      const MyShop(),
      const Text("data"),
      const Text("data"),
      TikTokProfilePage(accessToken: widget.accessToken)
    ];
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _myBottom(),
    );
  }

  Widget _myBottom() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: "Cửa hàng"),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Hộp thư"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hồ sơ"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: _onItemTapped, // Gắn hàm xử lý sự kiện
    );
  }
}
