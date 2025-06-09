import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_management_app/screens/category/category_add_popup.dart';
import 'package:money_management_app/screens/category/screen_category.dart';
import 'package:money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text('Money Manager'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      bottomNavigationBar: const MoneyManagementBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transactions');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('Add Category');
            ShowCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //     id: DateTime.now().microsecondsSinceEpoch.toString(),
            //     name: 'Grocery',
            //     type: CategoryType.expense);
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}
