SOSIFY + SUPABASE (versi awal)

ISI PAKET
- index.html: dashboard SOSIFY dengan registrasi/login Supabase dan penyimpanan proyek video.
- config.js: konfigurasi URL + Publishable key.
- supabase-schema.sql: tabel profil dan proyek video dengan Row Level Security.
- vercel.json: konfigurasi static hosting.

LANGKAH 1 — DATABASE
1. Buka Supabase Dashboard untuk project SOSIFY.
2. Buka SQL Editor > New query.
3. Salin seluruh isi supabase-schema.sql, lalu klik Run.
4. Pastikan tabel profiles dan video_projects tersedia di Table Editor.

LANGKAH 2 — KEY
1. Buka Project Settings > API.
2. Salin Publishable key (atau anon key jika project memakai format lama).
3. Buka config.js dan ganti TEMPEL_PUBLISHABLE_KEY_DI_SINI dengan key tersebut.
4. Jangan pernah memasukkan Secret key atau service_role key ke file frontend.

LANGKAH 3 — GITHUB & VERCEL
1. Ganti file index.html dan tambahkan config.js serta supabase-schema.sql di repository GitHub SOSIFY.
2. Pastikan vercel.json tetap ada.
3. Commit perubahan. Jika repo sudah terhubung ke Vercel, Vercel akan deploy otomatis.
4. Buka https://sosify.vercel.app dan coba daftar dengan email Anda.
5. Jika email confirmation aktif, konfirmasi email sebelum login. Di Supabase Authentication > URL Configuration, pastikan Site URL adalah https://sosify.vercel.app dan Redirect URLs mencakup https://sosify.vercel.app/**.

CATATAN
- Modul ini mengaktifkan autentikasi dan menyimpan data draft proyek video. Ini BELUM membuat file video AI.
- Dashboard statistik masih sebagian berupa data demo.
- Jangan bagikan password, Secret key, atau service_role key.
