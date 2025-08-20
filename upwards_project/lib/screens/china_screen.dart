import 'package:flutter/material.dart';
import 'package:upwards_project/core/app_colors.dart';
import 'package:upwards_project/screens/screen_details/user_header.dart';

class ChinaScreen extends StatelessWidget {
  const ChinaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final chinaItems = [
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Одежда',
        'quantity': '5/10',
        'status': 'На складе в Китае',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Обувь',
        'quantity': '10/10',
        'status': 'В пути',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Мебель',
        'quantity': '10/10',
        'status': 'На складе в Китае',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Обувь',
        'quantity': '10/10',
        'status': 'На складе в Китае',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Mебель',
        'quantity': '10/10',
        'status': 'В пути',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Одежда',
        'quantity': '5/10',
        'status': 'В пути',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Обувь',
        'quantity': '10/10',
        'status': 'На складе в Китае',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Мебель',
        'quantity': '10/10',
        'status': 'На складе в Китае',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
      {
        'clientCode': '12345678',
        'cargoNumber': '12345678',
        'category': 'Одежда',
        'quantity': '10/10',
        'status': 'В пути',
        'comment': 'есть стеклянные посуды сделанные из стекла',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(isTablet ? 80 : 56),
      //   child: UserHeader(isTablet: isTablet),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Грузы на складе в Китае',
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColors.borderColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Добавить груз',
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: isTablet ? 240 : 180,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Введите номер груза',
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  final tableMinWidth = isTablet ? 800.0 : 600.0;

                  final tableWidth = tableMinWidth > maxWidth
                      ? maxWidth
                      : tableMinWidth;
                  final fontSize = isTablet ? 14.0 : 12.0;
                  final showCommentColumn = isTablet;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: tableWidth),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                          AppColors.borderColor,
                        ),
                        headingTextStyle: const TextStyle(color: Colors.white),
                        dataRowMinHeight: 48,
                        columnSpacing: isTablet ? 24 : 12,
                        columns: [
                          const DataColumn(label: Text('Код клиента')),
                          const DataColumn(label: Text('Номер груза')),
                          const DataColumn(label: Text('Категория товара')),
                          const DataColumn(label: Text('Количество мест')),
                          const DataColumn(label: Text('Статус')),
                          if (showCommentColumn)
                            const DataColumn(label: Text('Комментарий')),
                          const DataColumn(label: Icon(Icons.remove_red_eye)),
                          const DataColumn(label: Icon(Icons.edit)),
                          const DataColumn(label: Icon(Icons.delete)),
                        ],
                        rows: chinaItems.map((item) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  item['clientCode']!,
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              DataCell(
                                Text(
                                  item['cargoNumber']!,
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              DataCell(
                                Text(
                                  item['category']!,
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              DataCell(
                                Text(
                                  item['quantity']!,
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              DataCell(
                                Text(
                                  item['status']!,
                                  style: TextStyle(
                                    color: item['status'] == 'В пути'
                                        ? Colors.green
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ),
                              if (showCommentColumn)
                                DataCell(
                                  Text(
                                    item['comment']!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              DataCell(
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                              const DataCell(
                                Icon(Icons.edit_outlined, size: 18),
                              ),
                              const DataCell(
                                Icon(Icons.delete_outline, size: 18),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
