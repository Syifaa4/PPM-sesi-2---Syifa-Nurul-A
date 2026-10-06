// ====== GANTI DATA INI DENGAN DATAMU ======
const String namaMahasiswa = 'Syifa Nurul Afifah';
const String nimMahasiswa = '20240040286';
const String prodiKelas = 'Teknik Informatika - TI24 G';
// ==========================================

// Mengubah angka 25000 menjadi "Rp 25.000"
String formatRupiah(int angka) {
  final teks = angka.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
  return 'Rp $teks';
}