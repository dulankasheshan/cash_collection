import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/customer_search_screen/layout/data_input_form_section.dart';

class CustomerSearchScreenProvider with ChangeNotifier {
  List<Map<String, String>> _searchResult = [];
  final List<Map<String, String>> _allUsers;
  String _searchQuery = '';
  String? _selectedUserName;

  CustomerSearchScreenProvider(this._allUsers) {
    // Initialize _searchResult with all users when the provider is created
    _searchResult = List.from(_allUsers);
  }

  List<Map<String, String>> get searchResult => _searchResult;
  String get searchQuery => _searchQuery;
  String? get selectedUserName => _selectedUserName;

  void updateSearchResult(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _searchResult = List.from(_allUsers);
    } else {
      _searchResult = _allUsers
          .where((user) =>
          user['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _searchResult = List.from(_allUsers);
    notifyListeners();
  }

  void showClientDataInputDialog(BuildContext context, String name) {
    _selectedUserName = name;
    notifyListeners();

    showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: this,
          child: DataInputFormSection(clientName: name),
        );
      },
    ).then((_) {
      _selectedUserName = null;
      notifyListeners();
    });
  }
}
