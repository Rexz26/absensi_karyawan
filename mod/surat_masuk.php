<?php
// Definisi fungsi untuk mengonversi ukuran file dari bytes ke megabytes (MB)
function convertToMB($bytes) {
    return number_format($bytes / 1024 / 1024, 2);
}

// Cek mod
if ($mod == '') {
    header('location:../404');
    exit;
} else {
    include_once 'mod/sw-header.php';
    if (!isset($_COOKIE['COOKIES_MEMBER']) && !isset($_COOKIE['COOKIES_COOKIES'])) {
        setcookie('COOKIES_MEMBER', '', 0, '/', '', true, true);
        setcookie('COOKIES_COOKIES', '', 0, '/', '', true, true);
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time() - $expired_cookie);
        setcookie("COOKIES_COOKIES", "", time() - $expired_cookie);
        session_destroy();
        header("location:./");
        exit;
    } else {
        // Database connection
        $connection = new mysqli("localhost", "root", "", "absensi_karyawan");
        if ($connection->connect_error) {
            die("Koneksi Gagal: " . $connection->connect_error);
        }

        $query = "SELECT * FROM surat_masuk ORDER BY tanggal_surat DESC";  
        $stmt = $connection->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();

        // Close database connection
        $connection->close();

        // Presentation logic (HTML)
        ?>
        <!-- App Capsule -->
        <div id="appCapsule">
            <div class="section mt-2">
                <a href="./reader" class="btn btn-danger"><ion-icon name="arrow-back-circle"></ion-icon>Kembali</a>
            </div>
            <div class="section">
                <button type="button" class="btn btn-success mt-2 btn-sortir" onclick="location.href='./input_surat_masuk'"><ion-icon name="add-circle"></ion-icon>Tambah Surat Masuk</button>
            </div>  
            <!-- Tambahkan kode untuk menampilkan data surat masuk -->
            <div class="section mt-2">
                <div class="card mb-3">
                    <div class="card-body">
                        <h2>Daftar Surat Masuk</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nomor Surat</th>
                                    <th>Asal Surat</th>
                                    <th>Tanggal Surat</th>
                                    <th>Tanggal Terima</th>
                                    <th>Perihal</th>
                                    <th>Ukuran File</th>
                                    <th>Jenis File</th>
                                    <th>File Surat</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            while ($row = $result->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td><?php echo $row['nomor_surat']; ?></td>
                                    <td><?php echo $row['asal_surat']; ?></td>
                                    <td><?php echo $row['tanggal_surat']; ?></td>
                                    <td><?php echo $row['tanggal_terima']; ?></td>
                                    <td><?php echo $row['perihal']; ?></td>
                                    <td><?php echo convertToMB(filesize("uploads/" . $row['file_surat'])); ?> MB</td>
                                    <td><?php echo pathinfo("uploads/" . $row['file_surat'], PATHINFO_EXTENSION); ?></td>
                                    <td><a href="uploads/<?php echo $row['file_surat']; ?>">Download</a></td>
                                </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <?php
    }
    include_once 'mod/sw-footer.php';
}
?>
