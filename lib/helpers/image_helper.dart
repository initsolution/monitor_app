import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

Future<void> captureDrawImageInfo(File imageFile, String path) async {
  final image = img.decodeImage(await imageFile.readAsBytes());
  final fontZipFile = await loadAssetFont();
  final font = img.BitmapFont.fromZip(fontZipFile.buffer.asUint8List());
  String dateTimeInfo = DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.now());

  if (image != null) {
    img.drawString(
      image,
      dateTimeInfo,
      font: font,
      x: image.width - 320,
      y: image.height - 200,
      color: img.ColorRgb8(0, 255, 255),
    );
    await img.encodeJpgFile(path, image);
  }
}

Future<ByteData> loadAssetFont() async {
  ByteData imageData = await rootBundle.load('assets/fonts/calibri.ttf.zip');
  return imageData;
}
