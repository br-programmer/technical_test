import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class NavBarHome extends StatelessWidget {
  const NavBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.1,
        decoration:
            BoxDecoration(color: AppColors.blueLight, borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
            children: List.generate(
          navBarItems.length,
          (index) {
            if (index == 2) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.orange, width: 1.5), borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(7.5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.orange, width: 2.5),
                    ),
                    child: Icon(navBarItems[index].iconData, color: AppColors.orange),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(navBarItems[index].iconData,
                        size: 30, color: (index == 0) ? AppColors.blue : AppColors.greyDark),
                    Text(
                      navBarItems[index].title,
                      style:
                          GoogleFonts.roboto(color: (index == 0) ? AppColors.blue : Colors.transparent, fontSize: 13),
                    ),
                  ],
                ),
              );
            }
          },
        )),
      ),
    );
  }
}

class _NavBarHome {
  final String title;
  final IconData iconData;

  const _NavBarHome({this.title, this.iconData});
}

const navBarItems = const [
  _NavBarHome(iconData: Icons.home, title: 'Inicio'),
  _NavBarHome(iconData: Icons.message, title: 'Message'),
  _NavBarHome(iconData: Icons.add, title: 'Nuevo'),
  _NavBarHome(iconData: Icons.favorite_border_sharp, title: 'Entregas'),
  _NavBarHome(iconData: Icons.person, title: 'Profile'),
];
