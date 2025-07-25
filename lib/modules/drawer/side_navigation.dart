import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  final Function(String route) onItemSelected;

  const SideNavigation({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Грузы'),
            children: [
              ListTile(
                leading: Image.asset("assets/images/icon1.png", width: 20, height: 20,),
                title: const Text('На складе в Китае'),
                onTap: () => onItemSelected('На складе в Китае'),
              ),
              ListTile(
                leading: Icon(Icons.notes),
                title: const Text('Сортировка'),
                onTap: () => onItemSelected('Сортировка'),
              ),
              ListTile(
                leading: Image.asset("assets/images/icon2.png", width: 20, height: 20,),
                title: const Text('Отправки'),
                onTap: () => onItemSelected('Отправки'),
              ),
            ],
          ),
          ExpansionTile(
            leading:   Image.asset("assets/images/icon3.png", width: 20, height: 20,),
            title: const Text('Посылки'),
            children: const [
              ListTile(title: Text('(пусто)')),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Выход'),
            onTap: () => onItemSelected('Выход'),
          ),
        ],
      ),
    );
  }
}
