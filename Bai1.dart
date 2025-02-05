import 'dart:io';

void main() {
  print("Ho ten sinh vien: ");
  var hoten = stdin.readLineSync();
  print("So gio lam viec: ");
  double giolam = double.parse(stdin.readLineSync().toString());
  print("Luong moi gio lam viec: ");
  double luongmoigio = double.parse(stdin.readLineSync().toString());

  double tongluong = giolam * luongmoigio;
  var phucap = tongluong * 0.2;
  var luongtruocthue;
  if (giolam > 40) {
    luongtruocthue = tongluong + phucap;
  }

  var thue;
  if (luongtruocthue > 10000000) {
    thue = luongtruocthue * 0.1;
  }
  if (luongtruocthue >= 7000000 && luongtruocthue <= 10000000) {
    thue = luongtruocthue * 0.05;
  }
  if (luongtruocthue < 7000000) {
    thue = 0;
  }

  var luongthuclanh;
  if (luongtruocthue > 10000000) {
    luongthuclanh = luongtruocthue - thue;
  }
  if (luongtruocthue >= 7000000 && luongtruocthue <= 10000000) {
    luongthuclanh = luongtruocthue - thue;
  }
  if (luongtruocthue < 7000000) {
    luongthuclanh = luongtruocthue;
  }

  print("Ho ten: $hoten");
  print("Luong truoc thue: $luongtruocthue");
  print("Thue thu nhap: $thue");
  print("Luong thuc lanh: $luongthuclanh");
}
