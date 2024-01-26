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
    int textColor) async {
  final image = img.decodeImage(await imageFile.readAsBytes());
  final fontZipFile = await loadAssetFont();
  final font = img.BitmapFont.fromZip(fontZipFile.buffer.asUint8List());
  String dateTimeInfo =
      DateFormat('d MMM yyyy HH:mm:ss').format(DateTime.now());

  var mColor = img.ColorRgb8(255, 193, 7);
  switch (textColor) {
    case 1:
      mColor = img.ColorRgb8(255, 193, 7);
      break;
    case 2:
      mColor = img.ColorRgb8(76, 175, 80);
      break;
    case 3:
      mColor = img.ColorRgb8(3, 169, 244);
      break;
    case 4:
      mColor = img.ColorRgb8(244, 67, 54);
      break;
    case 5:
      mColor = img.ColorRgb8(255, 255, 255);
      break;
    case 6:
      mColor = img.ColorRgb8(0, 0, 0);
      break;
    default:
      mColor = img.ColorRgb8(255, 255, 255);
  }

  if (image != null) {
    img.drawString(
      image,
      dateTimeInfo,
      font: font,
      x: image.width - 50,
      y: image.height - 280,
      rightJustify: true,
      color: mColor,
    );
    img.drawString(
      image,
      "${currentPosition?.longitude}, ${currentPosition?.latitude}",
      font: font,
      x: image.width - 50,
      y: image.height - 240,
      rightJustify: true,
      color: mColor,
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
        color: mColor,
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
