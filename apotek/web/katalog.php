<?php
require_once 'includes/koneksi.php';
include 'includes/header.php';

$query = $pdo->query("SELECT * FROM obat ORDER BY id DESC");
?>

<div class="bg-gray-50 text-gray-800 min-h-screen py-12 px-4">
  <div class="max-w-7xl mx-auto">
    <h1 class="text-3xl font-extrabold text-center text-slate-700 mb-8">Katalog Produk</h1>

    <!-- Search -->
    <div class="mb-8 text-center">
      <input id="search" placeholder="Cari nama obat..." class="w-full max-w-md px-4 py-2 border rounded-lg shadow-sm" />
    </div>

    <!-- Daftar produk -->
    <div id="katalog-list" class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
      <?php while ($o = $query->fetch()): ?>
        <div class="bg-white border rounded-xl shadow filter-item">
          <img src="<?= htmlspecialchars($o['gambar']) ?>" alt="<?= htmlspecialchars($o['nama']) ?>" class="w-full h-48 object-contain bg-slate-100 rounded-t-xl p-4">
          <div class="p-4">
            <h3 class="text-lg font-bold text-teal-700"><?= htmlspecialchars($o['nama']) ?></h3>
            <p class="text-sm text-gray-600">Rp <?= number_format($o['harga'], 0, ',', '.') ?></p>
            ...
          </div>
        </div>
      <?php endwhile; ?>
    </div>

    <div class="mt-12 text-center">
      <a href="index.php" class="inline-block bg-slate-700 hover:bg-slate-800 text-white px-6 py-2 rounded">← Kembali</a>
    </div>
  </div>
</div>

<script src="assets/js/katalog.js"></script>
<?php include 'includes/footer.php'; ?>
