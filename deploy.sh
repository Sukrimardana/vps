#!/bin/bash
# Buat file HTML sederhana
cat > halo.html << 'EOF' <!DOCTYPE html> <html> <head> <title>TMUX 
    Guide</title> <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: 
            #2c3e50;
            color: #ecf0f1;
        }
        .container { background: #34495e; padding: 30px; border-radius: 10px; 
            max-width: 800px; margin: 0 auto;
        }
        h1 { color: #3498db; } code { background: #1e272e; padding: 10px; 
            border-radius: 5px; display: block; margin: 10px 0;
        }
    </style> </head> <body> <div class="container"> <h1>🚀 Panduan TMUX</h1> 
        <p>Website sederhana untuk belajar TMUX</p>
        
        <h2>🔧 Perintah Dasar:</h2> <code>tmux new -s mysession</code> 
        <code>Ctrl+b d - Detach session</code> <code>tmux attach -t 
        mysession</code>
        
        <h2>📋 Shortcuts:</h2> <code>Ctrl+b c - Buat window baru</code> 
        <code>Ctrl+b n - Next window</code> <code>Ctrl+b p - Previous 
        window</code>
        
        <p>Server berjalan di GitHub Codespace! 🎉</p> </div> </body> </html> 
EOF
# Buat file index.html redirect
cat > index.html << 'EOF' <!DOCTYPE html> <html> <head> <meta 
    http-equiv="refresh" content="0; url=halo.html" /> 
    <title>Redirecting...</title>
</head> <body> <p>Redirecting to <a href="halo.html">halo.html</a></p> </body> 
</html> EOF echo "✅ File HTML berhasil dibuat!"
# Jalankan server
echo "🚀 Starting server on port 8000..." echo "📂 Directory: $(pwd)" echo "🌐 
URL: http://localhost:8000" echo "⏹️ Press Ctrl+C to stop" echo ""
# Cek Python dan jalankan server
if command -v python3 &> /dev/null; then python3 -m http.server 8000 elif 
command -v python &> /dev/null; then
    python -m http.server 8000 else echo "❌ Error: Python not found!" exit 1
fi
