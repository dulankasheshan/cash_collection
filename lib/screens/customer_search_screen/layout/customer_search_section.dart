import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/assets/index.dart';
import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../providers/customer_search_screen_provider.dart';

class CustomerSearchSection extends StatefulWidget {
  const CustomerSearchSection({super.key});

  @override
  State<CustomerSearchSection> createState() => _CustomerSearchSectionState();
}

class _CustomerSearchSectionState extends State<CustomerSearchSection> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _searchController.addListener(() {
      final searchProvider = Provider.of<CustomerSearchScreenProvider>(context, listen: false);
      searchProvider.updateSearchResult(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final searchProvider = Provider.of<CustomerSearchScreenProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeClass.getWidth(0.07),
        horizontal: SizeClass.getWidth(0.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white24,
              ),
              child: Row(
                children: [
                  SizedBox(width: SizeClass.getWidth(0.04)),
                  SvgPicture.asset(
                    eIconAssets.search,
                    color: appTheme.white,
                    width: SizeClass.getWidth(0.06),
                    height: SizeClass.getWidth(0.06),
                  ),
                  SizedBox(width: SizeClass.getWidth(0.03)),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search, // Show search button on keyboard
                      onSubmitted: (value) {
                        searchProvider.updateSearchResult(value); // Perform search action
                      },
                      focusNode: _focusNode,
                      controller: _searchController,
                      cursorColor: appTheme.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Client',
                        hintStyle: TextStyle(
                          color: appTheme.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeClass.getWidth(0.04),
                        ),
                      ),
                      style: TextStyle(
                        color: appTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeClass.getWidth(0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeClass.getWidth(0.03)),
          GestureDetector(
            onTap: () {
              if (_searchController.text.isNotEmpty) {
                _searchController.clear();
                searchProvider.clearSearch();
                _focusNode.unfocus();
              } else {
                _focusNode.requestFocus(); // Focus TextField if search icon is pressed and no text
              }
            },
            child: Container(
              width: SizeClass.getWidth(0.15),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: appTheme.gradient,
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black.withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  _searchController.text.isNotEmpty
                      ? eIconAssets.close
                      : eIconAssets.search,
                  color: appTheme.white,
                  width: SizeClass.getWidth(0.06),
                  height: SizeClass.getWidth(0.06),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
