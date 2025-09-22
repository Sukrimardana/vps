#!/bin/bash
# Script untuk menjalankan server HTML dengan file halo.html
echo "🔧 Memulai setup server HTML..."
# Cek apakah Python 3 tersedia
if command -v python3 &> /dev/null; then echo "🐍 Python 3 ditemukan" 
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then echo "🐍 Python ditemukan" 
    PYTHON_CMD="python"
else echo "❌ Error: Python tidak ditemukan!" exit 1 fi
# Cek apakah file halo.html ada
if [ -f "halo.html" ]; then echo "📄 File halo.html ditemukan"
    
    # Buat file index.html yang redirect ke halo.html
    echo "🔄 Membuat file redirect index.html -> halo.html" cat > index.html << 
    EOF
<!DOCTYPE html> <html> <head> <meta http-equiv="refresh" content="0; 
    url=halo.html" /> <title>Redirecting to halo.html</title>
</head> <body> <p>Redirecting to <a href="halo.html">halo.html</a></p> </body> 
</html> EOF
    
    # Tampilkan informasi
    echo "🌐 Server akan berjalan di port 8000" echo "📂 Direktori: $(pwd)" 
    echo "🔗 URL: http://localhost:8000" echo "" echo "⏹️ Tekan Ctrl+C untuk 
    menghentikan server" echo ""
    # Jalankan server
    echo "🚀 Memulai server..." $PYTHON_CMD -m http.server 8000 else echo "❌ 
    Error: File halo.html tidak ditemukan!" echo "💡 Pastikan file halo.html 
    ada di direktori ini" exit 1
fi
