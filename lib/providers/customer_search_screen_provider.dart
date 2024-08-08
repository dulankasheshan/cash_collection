import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/models/ClientDataModel.dart';
import '../screens/customer_search_screen/layout/data_input_form_section.dart';

class CustomerSearchScreenProvider with ChangeNotifier {
  List<ClientDataModel> _searchResult = [];
  final List<ClientDataModel> _allUsers;
  String _searchQuery = '';
  ClientDataModel? _selectedUser;

  CustomerSearchScreenProvider(this._allUsers) {
    _searchResult = List.from(_allUsers);
  }

  List<ClientDataModel> get searchResult => _searchResult;
  String get searchQuery => _searchQuery;
  ClientDataModel? get selectedUser => _selectedUser;

  void updateSearchResult(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _searchResult = List.from(_allUsers);
    } else {
      _searchResult = _allUsers.where((user) {
        return user.clientName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _searchResult = List.from(_allUsers);
    notifyListeners();
  }

  void showClientDataInputDialog(BuildContext context, ClientDataModel user) {
    _selectedUser = user;
    notifyListeners();

    showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: this,
          child: DataInputFormSection(clientName: user.clientName),
        );
      },
    ).then((_) {
      _selectedUser = null;
      notifyListeners();
    });
  }
}
