<?php
// flag is in flag.php
highlight_file(__FILE__);
if (isset($_GET['file'])) {
    $file = $_GET['file'];
    include($file);
}
