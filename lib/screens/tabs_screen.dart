import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/home_page_screen.dart';
import 'package:present_app/screens/my_details_screen.dart';
import 'package:present_app/screens/profile_screen.dart';


class TabsScreen extends StatefulWidget {
  
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 1;

@override
  void didChangeDependencies() {
    final productId = ModalRoute.of(context).settings.arguments as int;
    if(productId!=null){
      _selectedPageIndex=productId;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _pages = [
       {
        'page': const DetailseScreen(),
        'title': 'Search',
      },
      {
        'page': const HomePageScreen(),
        'title': 'Categories',
      },
     
      {
        'page': const ProfileScreen(),
        'title': 'Your Account',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
        
          unselectedItemColor: Colors.grey[800],
          
          backgroundColor: MyColors.myGreen,
          // ignore: deprecated_member_use
          selectedItemColor: MyColors.myWhite,
          showUnselectedLabels: true,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
           
            BottomNavigationBarItem(
                  backgroundColor: MyColors.myGreen,
              icon: const Icon(Icons.assessment),
              label: 'تفاصيلي الدراسية',
            ),
             // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              backgroundColor: MyColors.myGreen,
              icon: const Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                  backgroundColor: MyColors.myGreen,
              icon: const Icon(Icons.person_outline),
              label: 'الملف الشخصي',
            ),
          ],
        ),
      ),
    );
  }
 
}
