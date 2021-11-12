import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

// const String initialRoute = '/datatable2';
// Scaffold _getScaffold(BuildContext context, Widget body,
//     [List<String>? options]) {
//   var defaultOption = getCurrentRouteOption(context);
//   if (defaultOption.isEmpty && options != null && options.isNotEmpty)
//     defaultOption = options[0];
//   return
// }

// String _getCurrentRoute(BuildContext context) {
//   return ModalRoute.of(context) != null &&
//           ModalRoute.of(context)!.settings.name != null
//       ? ModalRoute.of(context)!.settings.name!
//       : initialRoute;
// }

class RowTable extends StatefulWidget {
  @override
  _RowTableState createState() => _RowTableState();
}

class _RowTableState extends State<RowTable> {
  List<DataColumn> items = [
    DataColumn2(
      label: Text('Column A'),
      size: ColumnSize.L,
    ),
    DataColumn(
      label: Text('Column B'),
    ),
    DataColumn(
      label: Text('Column C'),
    ),
    DataColumn(
      label: Text('Column D'),
    ),
    DataColumn(
      label: Text('Column NUMBERS'),
    ),
  ];
  List sour = [
    2,
    3,
    4,
    5,
    6,
  ];

  int i = 1;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  // A Variable to hold the length of table based on the condition of comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage

  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    //_getScaffold(context, PaginatedDataTableDemo());
    var dts = DTS();
    var tableItemsCount = dts.rowCount;

    // PaginatedDataTable.defaultRowsPerPage provides value as 10

    var defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;

    // We are checking whether tablesItemCount is less than the defaultRowsPerPage which means we are actually checking the length of the data in DataTableSource with default PaginatedDataTable.defaultRowsPerPage i.e, 10

    var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;

    // Assigning rowsPerPage as 10 or acutal length of our data in stored in the DataTableSource Object

    _rowsPerPage =
        isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        //shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('data'),
      ),
      body: i == 0
          ? DataTable2(
              columns: items,
              rows: List<DataRow>.generate(
                  100,
                  (index) => DataRow(cells: [
                        DataCell(Text('A' * (10 - index % 10))),
                        DataCell(Text('B' * (10 - (index + 5) % 10))),
                        DataCell(Text('C' * (15 - (index + 5) % 10))),
                        DataCell(Text('D' * (15 - (index + 10) % 10))),
                        DataCell(Text(((index + 0.1) * 25.4).toString()))
                      ])))
          : PaginatedDataTable2(
              columns: items,
              source: DTS(),
              onRowsPerPageChanged: (rowCount) {
                setState(() {
                  _rowsPerPage1 = rowCount!;
                });
              },
              rowsPerPage: isRowCountLessDefaultRowsPerPage
                  ? _rowsPerPage
                  : _rowsPerPage1,
            ),
    );
  }
}

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text('A' * (10 - index % 10))),
      DataCell(Text('B' * (10 - (index + 5) % 10))),
      DataCell(Text('C' * (15 - (index + 5) % 10))),
      DataCell(Text('D' * (15 - (index + 10) % 10))),
      DataCell(Text(((index + 0.1) * 25.4).toString()))
    ]);
  }

  @override
  int get rowCount => 100; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
