# 🍱 FreshSave — Save Food, Save Money
<img width="1910" height="829" alt="image" src="https://github.com/user-attachments/assets/4127eb7d-5b03-469e-a46c-8217d677f69f" />

**PPM Sesi 2 — Dasar Flutter dan Widget**

**Nama:** Syifa Nurul Afifah | **NIM:** 20240040286 | **Kelas:** Teknik Informatika - TI24 G

## 🎬 Video Demo
https://youtu.be/zK1ny5UBb8Y

## 📱 Tentang Aplikasi

FreshSave adalah prototype aplikasi mobile yang membantu pengguna membeli makanan layak konsumsi yang mendekati akhir masa penjualan dengan harga lebih hemat. Tujuannya mengurangi **food waste** sekaligus menghemat pengeluaran, terutama untuk mahasiswa, anak kos, dan pekerja.

> Ini prototype untuk tugas Sesi #2, jadi data produk disimpan di kode (tanpa login, database, atau pembayaran).

## ✨ Fitur

- **AppBar** `PPM Sesi 2 - Nama (NIM)` dengan logo daun dan ikon keranjang berbadge angka.
- **Kartu Profil** (`StatelessWidget`): foto, nama, NIM, prodi/kelas, 5 bintang, dan rating.
- **Kartu Produk** (`StatefulWidget`): gambar, nama, harga, kategori. Klik salah satu produk di grid untuk membukanya.
- **Favorite ❤️**: ikon hati berubah, jumlah like bertambah/berkurang.
- **Quantity `−` `+`**: minimal 1, total harga otomatis berubah.
- **Tambah ke Keranjang 🛒**: muncul `SnackBar` dan badge keranjang bertambah. Klik ikon keranjang untuk melihat isi dan totalnya.
- **Banner Promo**: `Stack` + `Positioned`, dengan tombol "Lihat Promo".

**Widget utama:** `Scaffold`, `Row`, `Column`, `Container`, `Card`, `Stack`, `Positioned`, `Icon`, `ElevatedButton`, `StatelessWidget`, `StatefulWidget`, `SnackBar`, `GridView`.

## 🗂️ Struktur Utama

```
lib/
├── main.dart              # Entry point & tema
├── screens/home_page.dart # Halaman utama
├── models/product.dart    # Model produk
└── widgets/
    ├── profile_card.dart  # StatelessWidget
    ├── product_card.dart  # StatefulWidget
    ├── product_tile.dart  # Kotak produk
    └── promo_banner.dart  # Stack + Positioned
```

## ▶️ Cara Menjalankan

```bash
git clone https://github.com/USERNAME/freshsave.git
cd freshsave
flutter pub get
flutter run
```

## 📸 Screenshot
<img width="1911" height="824" alt="image" src="https://github.com/user-attachments/assets/3f699b05-2522-4c8e-a46f-734679a7bb54" />
<img width="1917" height="822" alt="image" src="https://github.com/user-attachments/assets/765c6171-445e-4edd-9ab6-d8fcc2e07742" />
<img width="1917" height="822" alt="image" src="https://github.com/user-attachments/assets/6779bd96-d53e-489a-949d-9314c71496bc" />



