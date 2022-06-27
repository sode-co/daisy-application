import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/project_info_management.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/app/pages/admin/screens/dashboard/components/header.dart';
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
    var horizontalPadding = Responsive.isDesktop(context) ? 20.0 : 0.0;
    var verticalPadding = Responsive.isDesktop(context) ? 25.0 : 0.0;
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            const Header(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding * 0.2),
              child: const Text(
                'Quản lí dự án',
                style: TextStyle(
                  fontSize: 16.5,
                  color: Color(BuiltinColor.blue_gradient_01),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: SizedBox(
                  height: 800,
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                        selectionColor: Colors.grey.withOpacity(0.5),
                        headerColor: const Color(BuiltinColor.blue_gradient_01),
                        gridLineColor: Colors.black),
                    child: SfDataGrid(
                      selectionMode: SelectionMode.single,
                      onCellTap: (DataGridCellTapDetails details) {
                        Project project =
                            projects[details.rowColumnIndex.rowIndex - 1];
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectInfoManagement(project: project),
                          ),
                        );
                      },
                      allowSorting: true,
                      allowMultiColumnSorting: true,
                      rowsPerPage: 10,
                      source: _projectDataSource,
                      columnWidthMode: Responsive.isDesktop(context)
                          ? ColumnWidthMode.fill
                          : ColumnWidthMode.fitByCellValue,
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
            ),
          ],
        ),
      ),
    );
  }

  List<Project> getEmployeeData() {
    return [
      Project('Thiet ke logo ne', 'Logo & Webdesign', '22/10/2001', 'en',
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
      Project('Thiet ke banner', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke banner', 'Logo & Webdesign', '22/10/2001', 'en',
          'Description Lorem Ipsum Lorem Ipsum Lorem Ipsum', 221099.0),
      Project('Thiet ke banner', 'Logo & Webdesign', '22/10/2001', 'en',
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
        .map<DataGridRow>(
          (p) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'name', value: p.name),
              // DataGridCell<String>(columnName: 'name', value: p.name),
              DataGridCell<String>(columnName: 'category', value: p.category),
              DataGridCell<String>(
                  columnName: 'resolvedAt', value: p.resolvedAt),
              DataGridCell<String>(
                  columnName: 'language', value: p.preferredLanguage),
              DataGridCell<String>(
                  columnName: 'description', value: p.description),
              DataGridCell<double>(columnName: 'budget', value: p.budget),
            ],
          ),
        )
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
