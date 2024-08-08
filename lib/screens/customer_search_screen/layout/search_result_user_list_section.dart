import 'package:cash_collection/common/app_array.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../providers/client_data_input_provider.dart';
import '../../../providers/customer_search_screen_provider.dart';
import '../../../widgets/common_text.dart';

class SearchResultUserListSection extends StatelessWidget {
  const SearchResultUserListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.screenBg,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Consumer<CustomerSearchScreenProvider>(
        builder: (context, searchProvider, child) {
          final searchResult = searchProvider.searchResult;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (searchResult.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeClass.getWidth(0.05),
                      vertical: SizeClass.getWidth(0.05),
                    ),
                    child: CommonText(
                      text: 'Clients',
                      fontWeight: FontWeight.bold,
                      textColor: appTheme.darkText,
                      fontSize: SizeClass.getWidth(0.05),
                      textAlign: TextAlign.left,
                    ),
                  ),
                searchResult.isEmpty
                    ? Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeClass.getWidth(0.3)),
                  child: const Center(child: Text('No result found')),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    final user = searchResult[index];
                    final name = user.clientName ?? 'Unknown';
                    final image = user.clientImage;
                    final address = user.clientAddress ?? 'No address provided';

                    return GestureDetector(
                      onTap: () {
                        provider.setClientId(user.clientId);
                        provider.setRefId(AppArray().refId);
                        searchProvider.showClientDataInputDialog(context, user);
                      },
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1),
                          ),
                          child: CircleAvatar(
                            backgroundColor: appTheme.lightBGColor,
                            child: image != null
                                ? ClipOval(
                              child: Image.network(
                                image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: CommonText(
                                      text: name[0],
                                      textColor: appTheme.lightText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            )
                                : Center(
                              child: CommonText(
                                text: name[0],
                                textColor: appTheme.lightText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: CommonText(
                            text: name,
                            textColor: appTheme.darkText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: CommonText(
                            text: address,
                            textColor: appTheme.darkText,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
