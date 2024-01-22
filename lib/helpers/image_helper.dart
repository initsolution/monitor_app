import 'dart:io';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

Future<void> captureDrawImageInfo(
  File imageFile,
  String path,
  Position? currentPosition,
  List<String?> currentAddress,
) async {
  final image = img.decodeImage(await imageFile.readAsBytes());
  final fontZipFile = await loadAssetFont();
  final font = img.BitmapFont.fromZip(fontZipFile.buffer.asUint8List());
  String dateTimeInfo =
      DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.now());

  if (image != null) {
    img.drawString(
      image,
      dateTimeInfo,
      font: font,
      x: image.width - 50,
      y: image.height - 280,
      rightJustify: true,
      color: img.ColorRgb8(253, 216, 53),
    );
    img.drawString(
      image,
      "${currentPosition?.longitude}, ${currentPosition?.latitude}",
      font: font,
      x: image.width - 50,
      y: image.height - 240,
      rightJustify: true,
      color: img.ColorRgb8(253, 216, 53),
    );
    int limitH = 190;
    for (var string in currentAddress) {
      img.drawString(
        image,
        "$string",
        font: font,
        x: image.width - 50,
        y: image.height - limitH,
        rightJustify: true,
        color: img.ColorRgb8(253, 216, 53),
      );
      limitH -= 40;
    }

    await img.encodeJpgFile(path, image);
  }
}

Future<ByteData> loadAssetFont() async {
  ByteData imageData = await rootBundle.load('assets/fonts/calibri.ttf.zip');
  return imageData;
}
