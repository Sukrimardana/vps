
const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;
app.use(express.json());




const fs = require('fs');
const usersFile = path.join(__dirname, 'users.json');

function loadUsers() {
  try {
    return JSON.parse(fs.readFileSync(usersFile, 'utf8'));
  } catch (e) {
    return [];
  }
}

function saveUsers(users) {
  fs.writeFileSync(usersFile, JSON.stringify(users, null, 2));
}

// Endpoint untuk cek jumlah user terdaftar
app.get('/users/count', (req, res) => {
  const users = loadUsers();
  res.json({ count: users.length });
});

// Serve static files from the current directory
app.use(express.static(__dirname));

// Route untuk halaman utama
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Endpoint signup
app.post('/signup', (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ message: 'Username dan password wajib diisi' });
  }
  const users = loadUsers();
  if (users.find(u => u.username === username)) {
    return res.status(409).json({ message: 'Username sudah terdaftar' });
  }
  users.push({ username, password });
  saveUsers(users);
  res.json({ message: 'Registrasi berhasil' });
});

// Endpoint login
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  const users = loadUsers();
  const user = users.find(u => u.username === username && u.password === password);
  if (!user) {
    return res.status(401).json({ message: 'Username atau password salah' });
  }
  res.json({ message: 'Login berhasil' });
});

// Jalankan server
app.listen(port, '0.0.0.0', () => {
  console.log(`Server berjalan di port ${port}`);
  console.log(`URL lokal: http://localhost:${port}`);
  console.log('Untuk URL publik, buka tab "Ports" di terminal bawah');
});
