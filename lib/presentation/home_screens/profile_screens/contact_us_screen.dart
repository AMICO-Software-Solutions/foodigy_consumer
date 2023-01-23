import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodigy/controller/support_controller.dart';
import 'package:foodigy/presentation/home_screens/profile_screens/pdf_view_page.dart';
import 'package:foodigy/styles/foodigy_text_style.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/foodigy_const_data.dart';
import 'package:foodigy/widgets/profile/order_button.dart';
import 'package:foodigy/widgets/profile/profile_appbar.dart';
import 'package:foodigy/widgets/profile/profile_textForm_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final formkey = GlobalKey<FormState>();
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
  }

  File? image;

  final picker = ImagePicker();

  // ignore: prefer_final_fields
  List<File> _image = [];
  bool isloading = false;
  // chooseImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image.add(File(pickedFile!.path));
  //   });
  //   if (pickedFile!.path.isNotEmpty) {
  //     print(pickedFile.path.toString());
  //     retrieveLostData();
  //   }
  // }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt'],
    );
    if (result == null) return null;
    return File(result.paths.first ?? '');
  }

  // Future<void> retrieveLostData() async {
  //   final LostData response = await picker.getLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _image.add(File(response.file!.path));
  //     });
  //   } else {
  //     print(response.file);
  //   }
  // }

  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
          ),
        ),
      );
  File? file;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(text: 'Support'),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/images/contactUs.png"))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Customer Support",
                              style: FoodigyTextStyle.homeHeadLine,
                            ),
                            Text(
                                "Email: ${FoodigyConstData().supportEmail.toString()}",
                                style: FoodigyTextStyle.homeHeadLine),
                            Text("Call: +91-9790770374",
                                style: FoodigyTextStyle.homeHeadLine),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Leave us a message",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFormField(
                      hintText: "Name*",
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[A-Za-z]{5,29}$").hasMatch(value)) {
                          return "Enter first name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFormField(
                    hintText: "Email*",
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(value)) {
                        return "Enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFormField(
                      hintText: "Subject*",
                      controller: subjectController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[A-Za-z]{5,29}$").hasMatch(value)) {
                          return "Enter subject minimum 5 to 30";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFormField(
                    hintText: "Your message here..",
                    controller: messageController,
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: ElevatedButton(
                              onPressed: () async {
                                // String url = '';
                                file = await pickFile();
                                if (file == null) return;
                                print(file!.path.toString());
                                //  openPdf(context, file, url);
                                print(file.toString());

                                //   chooseImage();
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  MdiIcons.paperclip,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                         // width: MediaQuery.of(context).size.width / 2,
                         // height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Send",
                              style: TextStyle(color: Colors.grey),
                            ),
                            style: TextButton.styleFrom(
                                primary: Colors.purple,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins',)),
                            onPressed: (){
                              final form = formkey.currentState;
                              if (form!.validate()) {
                                form.save();
                                // File imagefile = file!.path;
                                // String path =file.path
                                //                       Uint8List imgbytes = await file!.readAsBytes();
                                // //OR
                                //                       Uint8List imgbytes1 = file!.readAsBytesSync();
                                //                       print(imgbytes.toString());
                                //                       print(imgbytes1.toString());
                                // file!.writeAsBytes(buffer.asUint8List(
                                //     .offsetInBytes, data.lengthInBytes));

                                //file!.writeAsBytes(bytes, flush: true)
                                // Uint8List bytes = file!.readAsBytesSync();
                                // ByteData.view(bytes.buffer);
                                // print(ByteData.view(bytes.buffer));
                                SupportController().sendMail(
                                    name: nameController.text,
                                    email: emailController.text,
                                    subject: subjectController.text,
                                    file: file,
                                    message: messageController.text);
                                nameController.clear();
                                emailController.clear();
                                subjectController.clear();
                                messageController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Future<File> writeToFile(Uint8List data) async {
    return File(file!.path).writeAsBytes(data);
  }
}
