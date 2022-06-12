import 'package:daisy_application/pages/admin/screens/dashboard/components/header.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProjectManagementBody extends StatefulWidget {
  const ProjectManagementBody({Key? key}) : super(key: key);

  @override
  State<ProjectManagementBody> createState() => _ProjectManagementBodyState();
}

class _ProjectManagementBodyState extends State<ProjectManagementBody> {
  List<Project> projects = <Project>[];
  late ProjectDataSource _projectDataSource;
  @override
  void initState() {
    super.initState();
    projects = getEmployeeData();
    _projectDataSource = ProjectDataSource(projectData: projects);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            const Header(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                      headerColor: const Color(BuiltinColor.blue_gradient_01),
                      gridLineColor: Colors.black),
                  child: SfDataGrid(
                    allowSorting: true,
                    allowMultiColumnSorting: true,
                    source: _projectDataSource,
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      GridColumn(
                        columnName: 'name',
                        label: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Tên dự án',
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'category',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Thể loại'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'resolvedAt',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Lần cập nhật cuối',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'language',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Ngôn ngữ'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'description',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Mô tả'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'budget',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Ngân sách'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Project> getEmployeeData() {
    return [
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke logo', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
    ];
  }
}

class Project {
  /// Creates the employee class with required details.
  Project(this.name, this.category, this.resolvedAt, this.preferredLanguage,
      this.description, this.budget);

  final String name;
  final String category;
  final String resolvedAt;
  final String? preferredLanguage;
  final String description;
  final double budget;
}

class ProjectDataSource extends DataGridSource {
  ProjectDataSource({required List<Project> projectData}) {
    _projectData = projectData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'category', value: e.category),
              DataGridCell<String>(
                  columnName: 'resolvedAt', value: e.resolvedAt),
              DataGridCell<String>(
                  columnName: 'language', value: e.preferredLanguage),
              DataGridCell<String>(
                  columnName: 'description', value: e.description),
              DataGridCell<double>(columnName: 'budget', value: e.budget),
            ]))
        .toList();
  }

  List<DataGridRow> _projectData = [];

  @override
  List<DataGridRow> get rows => _projectData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          e.value.toString(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }).toList());
  }
}
