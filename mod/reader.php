<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surat Masuk dan Keluar</title>
    <style>
        .rounded-corners {
            border-radius: 10px;
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .rounded-corners:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <?php
if ($mod ==''){
    header('location:../404');
    echo'kosong';
}else{
    include_once 'mod/sw-header.php';
if(!isset($_COOKIE['COOKIES_MEMBER']) && !isset($_COOKIE['COOKIES_COOKIES'])){
        setcookie('COOKIES_MEMBER', '', 0, '/');
        setcookie('COOKIES_COOKIES', '', 0, '/');
        // Login tidak ditemukan
        setcookie("COOKIES_MEMBER", "", time()-$expired_cookie);
        setcookie("COOKIES_COOKIES", "", time()-$expired_cookie);
        session_destroy();
        header("location:./");
}else{
    echo'<!-- PILIH SURAT MASUK ATAU KELUAR  -->
    <!-- App Capsule -->
    <div id="appCapsule" style="text-align: center;">
        <!-- Wallet Card -->
        <div class="section pt-1">
            <div class="wallet-card">
                <!-- Balance -->
                <div class="balance">
                    <div class="left">
                        <h1>Surat Keluar dan Masuk</h1>
                    </div>
                </div>
                <!-- * Balance -->
                <!-- Wallet Footer -->
                <div class="section mt-2 mb-2">
                    <a href="./surat_masuk" class="btn btn-success mr-1"><ion-icon name="log-in"></ion-icon>Surat Masuk</a>
                    <a href="./surat_keluar" class="btn btn-danger ml-1"><ion-icon name="log-out"></ion-icon>Surat Keluar</a>
                </div>
    
            </div>
        </div>
        <!-- * END UPDATE ABSENSI -->
    </div>';

}
include_once 'mod/sw-footer.php';
} 
?>


</body>
</html>
