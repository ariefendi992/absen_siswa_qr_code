import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class GuruScanPage extends StatefulWidget {
  const GuruScanPage({super.key});

  @override
  State<GuruScanPage> createState() => _GuruScanPageState();
}

class _GuruScanPageState extends State<GuruScanPage> {
  bool isScanCompleted = false;
  MobileScannerController cameraController = MobileScannerController();
  bool screenOpened = false;
  String nisn = '';

  void closeScreen() {
    isScanCompleted = false;
  }

  void screenWasClosed() {
    screenOpened = false;
  }

  @override
  void initState() {
    super.initState();
    this.screenWasClosed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primary,
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
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/mainGuru', (route) => false);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Place the QR Code in the area',
                      style: TextStyle(fontSize: 18, fontWeight: bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Scanning wil be started automatically',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.normal,
                      // facing: CameraFacing.front,
                      torchEnabled: false,
                      autoStart: true,
                    ),
                    onDetect: foundBarcode,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  nisn,
                  style: TextStyle(
                    color: kBlackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void foundBarcode(capture) {
    print('CAPTURE ==>> [$capture]');

    final List<Barcode> barcodes = capture.barcodes;

    if (!screenOpened) {
      for (final barcode in barcodes) {
        print('NISN FOUND ${barcode.rawValue}');
        print('TYPE ===> [${barcode.displayValue}]');
        final String code = barcode.rawValue ?? '___';
        setState(() {
          nisn = '${barcode.rawValue}';
        });
      }
    }
  }
}
