import 'package:flutter/material.dart';
import 'visual_search2.dart';
import 'package:image_picker/image_picker.dart';

class VisualSearchScreen1 extends StatefulWidget {
  const VisualSearchScreen1({super.key});

  @override
  State<VisualSearchScreen1> createState() => _VisualSearchScreen1State();
}

class _VisualSearchScreen1State extends State<VisualSearchScreen1> {
  void switchToVisualSearchScreen2(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VisualSearchScreen2(uploadedImage: image),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(38),
          child: AppBar(
            backgroundColor: const Color(0xff1E1F28),
            automaticallyImplyLeading: false,
            title: Text(
              'Visual search',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            centerTitle: true,
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/visualSearchBgPhoto.png',
                      ),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                  ),
                  Text(
                    'Search for an outfit by taking a photo or uploading an image',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF3651),
                          minimumSize: const Size.fromHeight(44),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        switchToVisualSearchScreen2(ImageSource.camera);
                      },
                      child: Text(
                        'TAKE A PHOTO',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        minimumSize: const Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(color: Color(0xffF6F6F6)))),
                    onPressed: () {
                      switchToVisualSearchScreen2(ImageSource.gallery);
                    },
                    child: Text(
                      'UPLOAD AN IMAGE',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
