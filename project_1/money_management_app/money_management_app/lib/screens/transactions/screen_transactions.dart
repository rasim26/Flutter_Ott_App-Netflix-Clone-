import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transactions/transaction_model.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDb.instance.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDb.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
          padding: EdgeInsets.all(10),
          //values
          itemBuilder: (ctx, index) {
            final _value = newList[index];
            return Slidable(
              key: Key(_value.id!),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      TransactionDb.instance.deleteTransaction(_value.id!);
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                  )
                ],
              ),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      parseDate(_value.date),
                      textAlign: TextAlign.center,
                    ),
                    radius: 50,
                    //again a ternary operation
                    backgroundColor: _value.type == CategoryType.income
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text('${_value.amount} /-'),
                  subtitle: Text(_value.category.name),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
    /*here, only two parts, hence we use first& last bcz first
    is 0 and second is one, incase of more than one, its first
    and last is different*/
    //return '${date.day}\n${date.month}';
  }
}
