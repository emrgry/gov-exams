// ignore_for_file: public_member_api_docs
import 'package:gov_exams/widgets/drawer/model/drawer_model.dart';

class ExamModel {
  ExamModel({required this.examName, required this.menuNames});

  final String examName;
  final List<DrawerMenuItemModel> menuNames;
}
