import 'package:blog_app/controller/file_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
FileController fileController =Get.put(FileController());
Future pickFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image);
  fileController.file.value = result!.files.first;
}