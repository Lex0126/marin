import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:marin/see_Supplier.dart';
import 'package:marin/release_Client.dart';
import 'package:marin/release_Supplier.dart';
import 'package:marin/disable_Client.dart';
import 'package:marin/disable_Supplier.dart';
import 'package:marin/release_Project.dart';
import 'package:marin/see_Projects.dart';
import 'package:marin/add_Task.dart';
import 'package:marin/see_Client.dart';
import 'package:marin/see_C.dart';

class SeeClient extends StatefulWidget {
  const SeeClient({super.key});

  @override
  State<SeeClient> createState() => _SeeClientState();
}

class _SeeClientState extends State<SeeClient> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Cambia el número de pestañas según lo que necesites
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8470A1),
      body: SafeArea(
        child: Column(
          children: [
            buildTitle(context),
            buildTabMenu(),
            Expanded(child: buildTabContent()),
           
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
          
          const Text(
            'Clientes',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }


   Widget buildTabMenu() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white54,
      tabs: const [
        Tab(text: "Clientes"),
        Tab(text: 'Crear Clientes'),
        Tab(text: 'Clientes Inhabilitados'),
      ],
    );
  }

  Widget buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        SeeC(),
        Release_Client(),
        DisableClient(),
      ],
    );
  }
    Widget buildContentContainer() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2F2740),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _searchText.isEmpty ? '' : 'Resultados para "$_searchText"',
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


