SOSIFY FREE VIDEO STUDIO — PAKET DEPLOY VERCEL

FITUR
- Login dan registrasi menggunakan Supabase Auth.
- Menyimpan profil dan riwayat proyek ke tabel Supabase yang sudah dibuat.
- Slideshow foto (hingga 12 gambar), adegan teks, iklan produk berbasis scene.
- Gerakan kamera sederhana (pan/zoom) pada foto.
- Rasio 9:16, 16:9, 1:1.
- Musik latar opsional dari file milik pengguna.
- Preview dan render video di browser, tanpa API video AI berbayar.
- Download memakai MediaRecorder. Browser dapat menghasilkan WebM atau MP4 jika codec MP4 didukung.

PENTING
Ini adalah video editor berbasis template, bukan generative AI text-to-video. Tidak ada biaya API video, tetapi rendering memakai CPU/RAM perangkat pengguna. File video diunduh langsung dan tidak diunggah ke Supabase. Riwayat menyimpan metadata proyek.

CARA UPDATE WEBSITE
1. Ekstrak ZIP.
2. Buka config.js dan ganti TEMPEL_PUBLISHABLE_KEY_DI_SINI dengan Supabase Publishable key/anon key milik project Anda.
3. Jangan masukkan Secret key atau service_role key.
4. Di repository GitHub yang terhubung ke Vercel, ganti index.html lama dengan index.html baru.
5. Tambahkan config.js dan vercel.json (jika belum ada).
6. Commit perubahan; tunggu deployment Vercel berstatus Ready.
7. Buka https://sosify.vercel.app, login, buat video uji coba.

DATABASE
Paket ini memakai tabel yang sudah dibuat sebelumnya:
- public.profiles
- public.video_projects

Tidak perlu menjalankan SQL lagi jika tabel dan RLS dari paket integrasi sebelumnya sudah berhasil dibuat.

AUTH URL
Di Supabase Authentication > URL Configuration:
Site URL: https://sosify.vercel.app
Redirect URL: https://sosify.vercel.app/**

TROUBLESHOOTING
- "Invalid API key": periksa Publishable key di config.js.
- "relation video_projects does not exist": jalankan supabase-schema.sql dari paket integrasi sebelumnya.
- "row-level security policy": pastikan policies tabel profiles dan video_projects sudah dibuat dan pengguna sudah login.
- Render tanpa audio: pastikan file audio didukung browser dan izinkan autoplay jika diminta.
- MP4 tidak tersedia: browser otomatis memakai WebM jika codec MP4 tidak didukung. Chrome/Edge desktop umumnya pilihan terbaik.
