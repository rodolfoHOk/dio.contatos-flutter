import 'dart:io';

import 'package:contatos_flutter/shared/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  XFile? image;

  late ImagePicker imagePicker;

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  Future<CroppedFile?> cropImage(XFile imageFile) async {
    return await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }

  void saveImage(CroppedFile croppedFile) async {
    await ImageGallerySaver.saveFile(croppedFile.path);
    image = XFile(croppedFile.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar contato"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CustomFormField(
                label: "Nome",
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                label: "E-mail",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                label: "Telefone",
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.camera),
                                        title: const Text("Câmera"),
                                        onTap: () async {
                                          image = await imagePicker.pickImage(
                                              source: ImageSource.camera);
                                          if (image != null) {
                                            var croppedImage =
                                                await cropImage(image!);
                                            if (croppedImage != null) {
                                              saveImage(croppedImage);
                                            }
                                          }
                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text("Galeria"),
                                        onTap: () async {
                                          image = await imagePicker.pickImage(
                                              source: ImageSource.gallery);
                                          if (image != null) {
                                            var croppedImage =
                                                await cropImage(image!);
                                            if (croppedImage != null) {
                                              saveImage(croppedImage);
                                            }
                                          }
                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(
                                color: Colors.indigo,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Adicionar Imagem",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  image == null
                      ? const SizedBox(
                          width: 64,
                          height: 64,
                          child: Icon(
                            Icons.image_search,
                            size: 40,
                          ),
                        )
                      : SizedBox(
                          width: 64,
                          height: 64,
                          child: Image.file(
                            File(image!.path),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
