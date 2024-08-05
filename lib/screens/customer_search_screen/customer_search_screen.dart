import 'package:cash_collection/screens/customer_search_screen/layout/customer_search_section.dart';
import 'package:cash_collection/screens/customer_search_screen/layout/search_result_user_list_section.dart';
import 'package:cash_collection/screens/customer_search_screen/layout/search_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/theme/theme_service.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.primary,
        body: const Column(
          children: [
            SearchScreenAppBar(),
            CustomerSearchSection(),
            Expanded(child: SearchResultUserListSection()),
          ],
        ),
      ),
    );
  }
}
