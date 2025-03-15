import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/data/dummy_categories.dart';
import 'package:cherry_mvp/features/home/widgets/category.dart';
import 'package:cherry_mvp/features/home/widgets/app_bar.dart';
import 'package:cherry_mvp/features/home/widgets/app-search.dart';

class DashboardScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Dashboard')),
    
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DashboardSearchBar(searchController: _searchController),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset(
                  AppImages.icButton,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                itemCount: dummyCategories.length,
                itemBuilder: (context, index) {
                  return SingleCategory(category: dummyCategories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}