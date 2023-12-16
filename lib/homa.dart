import 'package:flutter/material.dart';
import 'package:flutter_application_9/next_screen.dart';
import 'package:get/get.dart';

class GetNavigation extends StatelessWidget {
  const GetNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      getPages: [
        GetPage(name: '/', page: () => const GetNavigation()),
        GetPage(name: '/next', page: () => const NextScreen()),
      ],
      // If you want to listen Get events to trigger actions,
      // you can to use routingCallback to it
      routingCallback: (routing) {
        if (routing!.current == '/next') {
          debugPrint('Open Ads');
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Navigation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Yeni bir ekrana gitmek için
                  var data = await Get.to(
                    //Bir widget yerine bir widget işlevi kullanmak, widget'ın
                    // ve denetleyicilerinin artık kullanılmadıklarında bellekten
                    //kaldırılacağını tam olarak garanti eder.
                    () => const NextScreen(),
                    // transition: Transition.rightToLeft,
                    // duration: const Duration(seconds: 1),
                    // curve: Curves.easeInOut,
                    // https://api.flutter.dev/flutter/animation/Curves-class.html
                    arguments: 'Hello World from Get.to()',
                  );

                  debugPrint(data);
                },
                child: const Text('Get.to(NextScreen())'),
              ),
              ElevatedButton(
                onPressed: () {
                  //Bir sonraki ekrana gitmek için ve önceki ekrana geri dönme seçeneği yok
                  //(Açılış Ekranlarında, giriş ekranlarında vb. Kullanım için).)
                  Get.off(
                    const NextScreen(),
                    arguments: 'Hello World from Get.off()',
                  );
                },
                child: const Text('Get.off(NextScreen())'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/next',
                    arguments: 'Hello World from Get.toNamed("/next")',
                  );
                },
                child: const Text('Get.toNamed("/next")'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(
                    '/next',
                    arguments: 'Hello World from Get.offNamed("/next")',
                  );
                },
                child: const Text('Get.offNamed("/next")'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
