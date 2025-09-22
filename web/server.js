const express = require('express'); const path = require('path'); const app = 
express(); const port = process.env.PORT || 3000;
// Serve static files from the current directory
app.use(express.static(__dirname));
// Route untuk halaman utama
app.get('/', (req, res) => { res.sendFile(path.join(__dirname, 'index.html'));
});
// Jalankan server
app.listen(port, '0.0.0.0', () => { console.log(`Server berjalan di port 
  ${port}`); console.log(`URL lokal: http://localhost:${port}`); 
  console.log('Untuk URL publik, buka tab "Ports" di terminal bawah');
});
