import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Next Screen'),
            Text('argument: ${Get.arguments}'),
            Text('parameters: ${Get.parameters['id']}'),
            ElevatedButton(
              onPressed: () {
                // Yeni bir ekrana gitmek için
                Get.back(
                  result: 'success',
                  //[kaplamaları kapat] ayarınız true ise, Alın.back(),
                  // şu anda açık olan snack bar / iletişim kutusunu /
                  // alt sayfayı VE geçerli sayfayı kapatır
                  closeOverlays: false,
                );
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
