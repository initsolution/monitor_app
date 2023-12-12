import 'package:intl/intl.dart';

String formatTanggalIndonesia(String tanggal, int type) {
  if (tanggal.contains('T')) {
    tanggal = tanggal.substring(0, tanggal.indexOf('T'));
  }

  DateTime dateTime = DateTime.parse(tanggal);
  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var y = DateFormat('yyyy').format(dateTime).toString();

  var month = "";
  var monthPendek = "";
  switch (m) {
    case '01':
      month = "Januari";
      monthPendek = "Jan";
      break;
    case '02':
      month = "Februari";
      monthPendek = "Feb";
      break;
    case '03':
      month = "Maret";
      monthPendek = "Mar";
      break;
    case '04':
      month = "April";
      monthPendek = "Apr";
      break;
    case '05':
      month = "Mei";
      monthPendek = "Mei";
      break;
    case '06':
      month = "Juni";
      monthPendek = "Jun";
      break;
    case '07':
      month = "Juli";
      monthPendek = "Jul";
      break;
    case '08':
      month = "Agustus";
      monthPendek = "Agt";
      break;
    case '09':
      month = "September";
      monthPendek = "Sep";
      break;
    case '10':
      month = "Oktober";
      monthPendek = "Okt";
      break;
    case '11':
      month = "November";
      monthPendek = "Nov";
      break;
    case '12':
      month = "Desember";
      monthPendek = "Des";
      break;
    default:
      month = "-";
      monthPendek = "-";
      break;
  }

  switch (type) {
    case 1:
      return "$d $month $y";
    case 2:
      return "$d $monthPendek $y";
    case 3:
      return "$d/$m/$y";
    default:
      return "$d $month $y";
  }
}

int selisihTanggal(String tanggal) {
  if (tanggal.contains('T')) {
    tanggal = tanggal.substring(0, tanggal.indexOf('T'));
  }

  DateTime dateTime = DateTime.parse(tanggal);
  return dateTime.difference(DateTime.now()).inDays;
}
