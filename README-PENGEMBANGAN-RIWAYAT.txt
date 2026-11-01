SOSIFY - PENGEMBANGAN RIWAYAT & EDIT PROYEK

FITUR BARU
- Daftar riwayat menampilkan judul, jenis konten, durasi, rasio, status, dan tanggal.
- Tombol Edit memuat kembali judul, naskah, gaya visual, jenis konten, durasi, dan rasio.
- Setelah proyek diedit dan dirender ulang, data proyek yang sama diperbarui (tidak membuat baris riwayat baru).
- Tombol Hapus menghapus metadata proyek milik akun yang sedang login.
- Akses data tetap dibatasi berdasarkan user_id dan kebijakan RLS Supabase.

PENTING
- Ganti HANYA index.html di GitHub dengan file dari paket ini.
- Jangan mengganti config.js atau menaruh Secret/service_role key di frontend.
- Tidak perlu menjalankan SQL tambahan karena tabel dan kebijakan yang digunakan sudah ada pada skema SOSIFY sebelumnya.
- File video hasil render tetap diunduh ke perangkat. Riwayat Supabase hanya menyimpan metadata dan naskah; foto, musik, serta file video belum diunggah ke cloud.
- Saat membuka proyek lama untuk diedit, foto dan musik harus dipilih ulang karena file aslinya tidak tersimpan di tabel video_projects.

CARA DEPLOY
1. Ekstrak ZIP.
2. Ganti index.html di repository GitHub.
3. Commit perubahan.
4. Tunggu Vercel berstatus Ready.
5. Buka https://sosify.vercel.app lalu tekan Ctrl+Shift+R.
6. Masuk ke menu Proyek Saya, coba Edit satu proyek, lalu render ulang.
7. Uji tombol Hapus hanya pada proyek percobaan yang memang ingin dihapus.
