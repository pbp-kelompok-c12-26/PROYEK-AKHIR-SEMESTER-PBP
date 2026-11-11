# SwapDrobe — Aplikasi Mobile

**Kelompok C12 PBP**

*“Swap what you have, keep it in the loop”*

SwapDrobe adalah aplikasi mobile untuk mengelola *wardrobe* digital, menyusun dan menjadwalkan *outfit*, serta melakukan tukar pakaian layak pakai dengan pengguna lain melalui *swap request*. Aplikasi ini membantu pengguna memaksimalkan pakaian yang dimiliki dan mendorong penggunaan fashion yang lebih berkelanjutan.

Aplikasi mobile dibuat dengan Flutter dan dirancang untuk menggunakan web service Django REST Framework (DRF) pada proyek website PWS SwapDrobe. Setelah integrasi endpoint selesai, aplikasi mobile dan website akan memakai backend serta sumber data yang sama.

## Tautan

- **Repositori aplikasi Flutter**: [PROYEK-AKHIR-SEMESTER-PBP](https://github.com/pbp-kelompok-c12-26/PROYEK-AKHIR-SEMESTER-PBP)
- **Website PWS / layanan backend**: [stephanie-revalina-swapdrobe.pws.cs.ui.ac.id](https://stephanie-revalina-swapdrobe.pws.cs.ui.ac.id/)
- **Desain Figma SwapDrobe**: [Figma Mobile Design SwapDrobe](https://www.figma.com/design/IYIk4KFx26bL2SRAvCVp8v/Prototype-Mobile-Apps-PBP---C12?node-id=2001-733&t=9jV1ZNbDW1iXOORr-1) *(tautan dari proyek website; perbarui jika tersedia tautan khusus desain mobile)*
- **APK**: akan ditambahkan setelah Checkpoint 1.

## Anggota Kelompok

| Nama | NPM |
| :--- | :--- |
| Stephanie Revalina Tamus | 2506547153 |
| Muhammad Zahran Affan | 2506586103 |
| Iqbal Virdiansyah | 2506656816 |
| Nafisa Naila Andian | 2506657125 |
| Sultoni Rico Sabillilah | 2506657365 |

## Modul dan Pembagian Kerja

| Modul | Penanggung jawab | Cakupan utama |
| :--- | :--- | :--- |
| Manajemen Akun & Autentikasi | Iqbal Virdiansyah | Registrasi, login/logout, profil dan edit profil, preferensi gaya/ukuran, serta pengelolaan akun. |
| Wardrobe Digital, Jelajahi & Onboarding | Stephanie Revalina Tamus | Koleksi pakaian dan *outfit* pribadi, onboarding, serta halaman Jelajahi. |
| Outfit Calendar | Nafisa Naila Andian | Menjadwalkan *outfit*, melihat kalender, dan mencatat riwayat pemakaian. |
| Items for Swap | Sultoni Rico Sabillilah | Menawarkan pakaian untuk ditukar, melihat daftar item, dan mengelola penawaran. |
| Swap Request | Muhammad Zahran Affan | Mengajukan dan mengelola permintaan tukar, perubahan status, serta konfirmasi pertukaran. |
| Jelajahi & Disukai (kolaborasi) | Stephanie Revalina Tamus & Muhammad Zahran Affan | Katalog item swap pengguna lain, pencarian/filter, dan daftar item yang disukai. |

## Fitur Teknis per Modul

Fitur berikut merangkum aturan bisnis dan perilaku teknis SwapDrobe yang berasal dari proyek website PTS. Aplikasi Flutter akan mengakses data dan operasi tersebut melalui endpoint DRF di PWS.

### Wardrobe Digital (Stephanie)

- CRUD pakaian dan *outfit*. Validasi pakaian mencakup foto JPG/PNG maksimal 5 MB, kecocokan ukuran pakaian atau sepatu, dan *outfit* yang berisi 1–5 pakaian milik pengguna.
- *Soft delete* mempertahankan riwayat pakaian yang pernah dipakai pada *outfit*, kalender, atau pertukaran.
- Hapus banyak pakaian diproses dalam satu transaksi.
- Pencarian, filter, pengurutan, dan penandaan pakaian yang jarang dipakai tersedia pada koleksi pengguna.
- Backend memeriksa kepemilikan data, membatasi permintaan, dan mengirim status yang sesuai saat sesi autentikasi berakhir.

### Manajemen Akun & Autentikasi (Iqbal)

- Registrasi dengan validasi password, nomor HP, dan domisili. Nomor HP dinormalisasi dan harus unik.
- Foto profil JPG/PNG maksimal 5 MB divalidasi berdasarkan isi file.
- Profil mendukung perubahan data, preferensi gaya dan ukuran, penggantian password, penghapusan akun, serta profil publik.
- Preferensi banyak pilihan disimpan sebagai `JSONField`.
- Onboarding setelah registrasi mencakup pengenalan aplikasi, pengaturan profil, serta preferensi gaya dan ukuran; alur onboarding dikerjakan bersama halaman Home oleh Stephanie.

### Outfit Calendar (Nafisa)

- Kalender bulanan menampilkan jadwal *outfit* dan daftar jadwal mendatang; satu tanggal hanya dapat memiliki satu jadwal.
- `ScheduledItem` menyimpan *snapshot* nama pakaian agar riwayat tetap tersedia setelah pakaian atau *outfit* diubah maupun dihapus.
- `last_worn_date` diperbarui saat jadwal dibuat, diubah, atau dihapus, sehingga status pakaian yang jarang dipakai tetap akurat.

### Items for Swap (Sultoni Rico)

- Pakaian dari lemari ditawarkan untuk ditukar melalui transaksi atomik agar satu pakaian tidak ditawarkan dua kali.
- Lokasi pertemuan menyimpan data kota/kabupaten terstruktur dan detail tempat; pilihan lokasi divalidasi oleh server.
- Pengguna dapat mengubah penawaran atau mengembalikan pakaian ke lemari.
- Listing yang sedang dalam proses pertukaran dikunci. Penyelesaian pertukaran mengubah status listing menjadi *Swapped*; penghapusan listing mengembalikan pakaian ke lemari.

### Swap Request (Muhammad Zahran)

- Alur status mencakup `Pending`, `Rejected`, `Awaiting exchange`, dan `Completed`.
- Pertukaran selesai setelah kedua pihak mengonfirmasi. Pemindahan kepemilikan kedua pakaian dan perubahan status dilakukan secara atomik.
- Sistem mencegah persetujuan request yang bentrok; pakaian yang sedang diminta tidak dapat diedit atau dihapus.
- Perubahan status menghasilkan notifikasi. Pengguna dapat melihat request terkirim dan diterima, serta menghapus satu atau beberapa request.

### Jelajahi, Disukai & Integrasi Lokasi (Stephanie & Muhammad Zahran)

- Jelajahi menampilkan katalog item swap dengan pencarian, filter kategori/gender/ukuran/warna/kondisi/lokasi, serta pengurutan.
- Pengguna dapat menyukai item dan melihat daftar item yang disukai.
- Data provinsi dan kota/kabupaten berasal dari API Wilayah Indonesia. Backend PWS menyediakan endpoint lokasi, menyimpan cache 24 jam dan cadangan 30 hari, serta menangani data yang tidak lengkap atau layanan yang tidak tersedia.
- Aplikasi mobile mengakses data lokasi melalui endpoint backend, bukan memanggil API eksternal langsung.

## Aktor Pengguna

- **User**: Mengelola profil, pakaian, *outfit*, jadwal, penawaran swap, dan permintaan pertukaran melalui aplikasi mobile.
- **Admin**: Mengelola data dan akun melalui Django Admin pada proyek website PWS. Admin bukan alur utama pengguna aplikasi mobile.

## Integrasi Aplikasi Mobile dengan Website PWS

Website PWS SwapDrobe menjadi backend dan sumber data bersama. Aplikasi Flutter dirancang sebagai klien endpoint DRF pada proyek Django PWS; aplikasi tidak akan menggunakan data modul statis.

Alur data:

1. Pengguna melakukan aksi pada halaman modul di aplikasi Flutter, misalnya melihat pakaian, membuat jadwal, atau mengirim *swap request*.
2. Flutter mengirim HTTP request ke endpoint DRF untuk modul terkait. Operasi baca menggunakan `GET`; operasi tambah, ubah, dan hapus menggunakan method HTTP sesuai kontrak endpoint, seperti `POST`, `PUT`/`PATCH`, dan `DELETE`.
3. DRF memvalidasi data dan hak akses, lalu Django membaca atau memperbarui data pada database proyek PWS.
4. DRF mengirim response JSON ke aplikasi Flutter. Aplikasi menampilkan hasilnya dan memperbarui tampilan berdasarkan response tersebut.

Setelah integrasi selesai, perubahan data dari website maupun aplikasi mobile akan tersimpan pada backend yang sama. Setiap modul akan mengakses endpoint sesuai kontrak API DRF pada proyek PWS; Flutter tidak mengakses database secara langsung.

## Teknologi

- **Mobile**: Flutter
- **Backend dan web service**: Django REST Framework pada proyek Django PWS SwapDrobe
- **Website/backend PWS**: [SwapDrobe PWS](https://stephanie-revalina-swapdrobe.pws.cs.ui.ac.id/)
