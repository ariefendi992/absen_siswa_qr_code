import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:absen_siswa_qr_code/views/guru/sub_menu/guru_result_scan_page.dart';
import 'package:absen_siswa_qr_code/views/widgets/screen_cam_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class GuruScanPage extends StatefulWidget {
  const GuruScanPage({super.key});

  @override
  State<GuruScanPage> createState() => _GuruScanPageState();
}

class _GuruScanPageState extends State<GuruScanPage> {
  MobileScannerController cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates, detectionTimeoutMs: 5000);
  bool torchOn = false;
  bool frontCamera = false;
  bool cameraOpened = false;
  bool shouldPop = true;

  void onCamera(capture) {
    List<Barcode> barcodes = capture.barcodes;

    if (!cameraOpened)
      for (final barcode in barcodes) {
        cameraOpened = true;
        final String username = barcode.rawValue ?? '___';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return GuruResultScanPage(
                username: username,
                closeCameraScreen: closeCameraScreen,
              );
            },
          ),
        );
      }
  }

  void closeCameraScreen() {
    cameraOpened = false;
  }

  @override
  void initState() {
    super.initState();
    cameraOpened = false;
    cameraController.stop();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: kWhiteColor,
          elevation: 0,
          title: Text(
            'Scan QR Code',
            style: TextStyle(
              fontWeight: bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  // context.read<PageCubit>().setPage(0);

                  Navigator.pop(context);
                  setState(() {
                    cameraOpened = false;
                  });
                  cameraController.stop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
              );
            },
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Stack(
          children: [
            MobileScanner(
              controller: cameraController,
              onDetect: onCamera,
              fit: BoxFit.cover,
              startDelay: true,
            ),
            QRScannerOverlay(
              overlayColour: Colors.transparent.withOpacity(0.6),
            ),
            Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 6.0),
                        child: Text(
                          'Scan QR Code di sini',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),

                ///* DISABLED FLASH ON WIDGET
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),

                    // alignment: Alignment.center,
                    // child: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         IconButton(
                    //           onPressed: !frontCamera
                    //               ? () {
                    //                   setState(() {
                    //                     torchOn = !torchOn;
                    //                   });

                    //                   cameraController.toggleTorch();
                    //                 }
                    //               : () {},
                    //           icon: Icon(
                    //             torchOn == false
                    //                 ? Icons.flash_on_rounded
                    //                 : Icons.flash_off_rounded,
                    //             color: !frontCamera
                    //                 ? kWhiteColor
                    //                 : kWhiteColor.withOpacity(0.5),
                    //             size: 36,
                    //           ),
                    //         ),
                    //         Text(
                    //           torchOn ? 'Flash OFF' : 'Flash ON',
                    //           style: TextStyle(
                    //             color: kWhiteColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(width: 32),
                    //     Column(
                    //       children: [
                    //         IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               frontCamera = !frontCamera;
                    //             });

                    //             cameraController.switchCamera();
                    //           },
                    //           icon: Icon(
                    //             frontCamera == false
                    //                 ? Icons.camera_front_rounded
                    //                 : Icons.camera_rear_rounded,
                    //             color: kWhiteColor,
                    //             size: 36,
                    //           ),
                    //         ),
                    //         Text(
                    //           frontCamera ? 'Front Camera' : 'Rear Camera',
                    //           style: TextStyle(
                    //             color: kWhiteColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
