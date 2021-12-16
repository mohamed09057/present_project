import 'dart:io';

import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/models/http_exception.dart';
import 'package:present_app/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  static const routeName = '/scan-screen';
  const ScanQrCodeScreen({Key key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'Qr');
  QRViewController controller;
  Barcode barcode;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text('حدث خطأ !'),
          content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: Text('تم'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAttendDialog(String text, String message) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(text),
          content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: Text('تم'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      ),
    );
  }

 void _showDialog() {
   
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: AlertDialog(
            title: Row(
              children: [
                Text('جار تسجيل الحضور ...'),
                SizedBox(width: 10,),
                 CircularProgressIndicator(color: MyColors.myGreen,),
              ],
            ),
            
          ),
        ),
      ),
    );
  }

  Future<void> _submit(String lectureId) async {
    setState(() {
    });

    try {
      _showDialog();
      // Log user in
      await Provider.of<Auth>(context, listen: false)
          .attendance(lectureId)
          .then((value) {
        if (value == true) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();

          _showAttendDialog('مبروووك !', "تم تسجيل حضورك بنجاااااح");
        }
      });
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';

      if (error.toString().contains('attendanced')) {
        errorMessage = 'لقد تم تسجيل حضورك مسبقا';
      }
          Navigator.of(context).pop();
          Navigator.of(context).pop();

      _showAttendDialog('عزرا !', errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
          Navigator.of(context).pop();
          Navigator.of(context).pop();

      _showErrorDialog(errorMessage);
    }

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text(' تسجيل حضور'),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
          ],
        ),
      ),
    );
  }



  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderWidth: 5,
        borderColor: MyColors.myGreen,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
      controller.stopCamera();
    _submit(barcode.code);
    });
  }
}
