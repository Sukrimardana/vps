#!/bin/bash
echo "🎉 Script berjalan!"
echo "📂 Directory saat ini:"
pwd
echo "📋 Daftar file sebelum:"
ls -la

# Buat file HTML sederhana
echo "🛠️ Membuat file halo.html..."
cat > halo.html << "EOF"
<!DOCTYPE html>
<html>
<head>
    <title>Test HTML</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f0f8ff; }
        .container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Berhasil!</h1>
        <p>File HTML ini dibuat otomatis oleh script bash.</p>
        <p>Waktu: <span id="time"></span></p>
        <script>
            document.getElementById("time").textContent = new Date().toLocaleString();
        </script>
    </div>
</body>
</html>
EOF

echo "📊 Daftar file setelah:"
ls -la
echo "✅ File halo.html berhasil dibuat!"
