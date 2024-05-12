<?php
// Pastikan file yang diminta adalah file yang valid
if(isset($_GET['file']) && !empty($_GET['file'])) {
    // Lokasi folder tempat file-file surat disimpan
    $folder = 'uploads/';

    // Nama file yang diminta
    $file = $_GET['file'];

    // Path lengkap file yang diminta
    $path = $folder . $file;

    // Periksa apakah file tersebut ada
    if(file_exists($path)) {
        // Set header untuk memicu unduhan
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . basename($path) . '"');
        header('Content-Length: ' . filesize($path));

        // Baca file dan kirimkan isinya ke output buffer
        readfile($path);

        // Selesai, keluar dari skrip
        exit;
    } else {
        // Jika file tidak ditemukan, tampilkan pesan error
        echo 'File tidak ditemukan.';
    }
} else {
    // Jika tidak ada nama file yang diberikan, tampilkan pesan error
    echo 'Nama file tidak valid.';
}
?>
