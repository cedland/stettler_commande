import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/order.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:stettlerproapp/classes/product.dart';

class OrdersNotifier extends StateNotifier<List<Order>> {
  OrdersNotifier() : super([]);

  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, 'orders.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE orders (orderNumber TEXT PRIMARY KEY,orderDate DATETIME NOT NULL,clientName TEXT NOT NULL,clientSurname TEXT NOT NULL,clientId TEXT NOT NULL,orderedItems TEXT NOT NULL,orderedQuantity TEXT,orderStatus TEXT NOT NULL,isFinished BOOLEAN NOT NULL);');
    }, version: 1);
    return db;
  }

  Future<void> loadOrders() async {
    final db = await _getDatabase();
    final data = await db.query('orders');
    final orders = data.map((row) {
      return Order(
          orderNumber: row['orderNumber'] as String,
          clientName: row['clientName'] as String,
          clientSurname: row['clientSurname'] as String,
          clientId: row['clientId'] as String,
          orderedItems: row['orderedItems'] as List<Product>,
          orderedQuantity: row['orderedQuantity'] as List<int>,
          orderStatus: row['orderStatus'] as OrderStatus,
          isFinished: row['isFinished'] as bool,
          orderDate: row['orderDate'] as DateTime);
    }).toList();
    state = orders;
  }

  void addOrderToDb(Order order) async {
    final db = await _getDatabase();
    await db.insert('orders', {
      'orderNumber': order.orderNumber,
      'orderDate': order.orderDate.toIso8601String(),
      'clientName': order.clientName,
      'clientSurname': order.clientSurname,
      'clientId': order.clientId,
      'orderedItems': jsonEncode(order.orderedItems), // Serialize the list
      'orderedQuantity':
          jsonEncode(order.orderedQuantity), // Serialize the list
      'orderStatus': order.orderStatus.toString(), // Convert enum to string
      'isFinished': order.isFinished ? 1 : 0 // Convert boolean to integer
    });

    state = [...state, order];
  }

  void addOrder(Order order) async {
    state = [...state, order];
  }

  void updateOrder(Order updatedOrder) {
    state = [
      for (var order in state)
        if (order.orderNumber == updatedOrder.orderNumber)
          updatedOrder
        else
          order,
    ];
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, List<Order>>((ref) {
  return OrdersNotifier();
});
