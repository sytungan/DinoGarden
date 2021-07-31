import 'dart:collection';

import 'package:dinogarden/model/Device_Auto.dart';
import 'package:flutter/material.dart';

class GlobalSchedule extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<DeviceAuto> _items = [];

  /// An unmodifiable view of the items in the cart.
  // UnmodifiableListView<DeviceAuto> get items => UnmodifiableListView(_items);

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(DeviceAuto item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  List<DeviceAuto> get listSchedule => _items;

  void setDevice(DeviceAuto item, index) {
    _items[0] = item;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
