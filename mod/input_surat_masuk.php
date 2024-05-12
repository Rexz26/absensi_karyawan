<?php
// Definisikan $expired_cookie
$expired_cookie = 3600;

if ($mod ==''){
    header('location:../404');
    exit;
} else {
    include_once 'mod/sw-header.php';
    if(!isset($_COOKIE['COOKIES_MEMBER']) && !isset($_COOKIE['COOKIES_COOKIES'])){
        setcookie('COOKIES_MEMBER', '', 0, '/');
        setcookie('COOKIES_COOKIES', '', 0, '/');
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
        setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
        session_destroy();
        header("location:./");
        exit;
    } else {
        // Database connection
        $connection = new mysqli("localhost", "root", "", "absensi_karyawan");
        if ($connection->connect_error) {
            die("Koneksi Gagal: " . $connection->connect_error);
        }
?>
        <!-- App Capsule -->
        <div id="appCapsule">
            <div class="section mt-2 mb-3">
                <a href="./surat_masuk" class="btn btn-danger mb-2"><ion-icon name="arrow-back-circle"></ion-icon>Kembali</a>
                <div class="card">
                    <div class="card-body">
                        <!-- Your form goes here -->
                        <form method="post" enctype="multipart/form-data">
                            <div>
                                <h2>Surat Masuk</h2>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="nomor_surat">Nomor Surat:</label>
                                        <input type="text" class="form-control" id="nomor_surat" name="nomor_surat">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="asal_surat">Asal Surat:</label>
                                        <input type="text" class="form-control" id="asal_surat" name="asal_surat">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="tanggal_surat">Tanggal Surat:</label>
                                        <input type="date" class="form-control" id="tanggal_surat" name="tanggal_surat">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="tanggal_terima">Tanggal Terima:</label>
                                        <input type="date" class="form-control" id="tanggal_terima" name="tanggal_terima">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="perihal">Perihal:</label>
                                        <input type="text" class="form-control" id="perihal" name="perihal">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="file_surat">File Surat:</label>
                                        <input type="file" class="form-control-file mb-1" id="file_surat" name="file_surat" accept="application/pdf">(Format: Nomor Surat_Surat Masuk_Nama Karyawan.pdf)</input>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right mt-1"> <!-- This div aligns the button to the right -->
                                <button type="submit" class="btn btn-success" name="submit"><ion-icon name="checkmark-circle"></ion-icon>Kirim</button>
                            </div>
                        </form>

                        <?php
                        if(isset($_POST['submit'])) {
                            // Check jika ada data yang kosong
                            if(empty($_POST['nomor_surat']) || empty($_POST['tanggal_surat']) || empty($_POST['tanggal_terima']) || empty($_POST['asal_surat']) || empty($_POST['perihal']) || empty($_FILES['file_surat'])) {
                                echo "<div class='alert alert-danger mt-1'>LENGKAPI SURAT</div>";
                            } else {
                                // Semua data terisi, lakukan penyimpanan ke database
                                // Mulai dengan mengambil nilai-nilai dari form
                                $nomor_surat = $_POST['nomor_surat'];
                                $tanggal_surat = $_POST['tanggal_surat'];
                                $tanggal_terima = $_POST['tanggal_terima'];
                                $asal_surat = $_POST['asal_surat'];
                                $perihal = $_POST['perihal'];
                                
                                // File handling
                                $file_surat = $_FILES['file_surat']['name'];
                                $file_type = $_FILES['file_surat']['type'];
                                $target_dir = "uploads/";
                                $target_file = $target_dir . basename($_FILES["file_surat"]["name"]);
                        
                                // Pindahkan file ke folder tujuan
                                if(move_uploaded_file($_FILES["file_surat"]["tmp_name"], $target_file)) {
                                    // Lakukan proses penyimpanan ke database
                                    $query = "INSERT INTO surat_masuk (nomor_surat, tanggal_surat, tanggal_terima, asal_surat, perihal, file_surat) 
                                    VALUES ('$nomor_surat', '$tanggal_surat', '$tanggal_terima', '$asal_surat', '$perihal', '$file_surat')";
                        
                                    if ($connection->query($query) === TRUE) {
                                        echo "<div class='alert alert-success mt-3'>SURAT BERHASIL DIKIRIM</div>";
                                    } else {
                                        echo "Error: " . $query . "<br>" . $connection->error;
                                    }
                                } else {
                                    echo "<div class='alert alert-danger mt-3'>Gagal mengunggah file.</div>";
                                }
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
<?php
    }
    include_once 'mod/sw-footer.php';
}
?>
