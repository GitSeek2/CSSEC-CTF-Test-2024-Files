<?php
// article.php
include_once 'conn.php';
global $conn;

// 查询文章
if (isset($_GET['id'])) {
    // 检查 User Agent 是否包含 sqlmap
    if (strpos($_SERVER['HTTP_USER_AGENT'], 'sqlmap') !== false) {
        die('Script Kiddies not allowed!');
    }
    $id = $_GET['id'];
    $sql = "SELECT * FROM articles WHERE id='$id' LIMIT 0,1";
    $result = $conn->query($sql);
    $article = $result->fetch_assoc();
    if (!$article) {
        die('文章不存在');
    }
} else {
    die('缺少参数 id');
}
?>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>
        <?php echo $article['title'] . " - CSSEC's BLog"; ?>
    </title>
    <link rel="stylesheet" href="./assets/style.css">
</head>
<body>

<header class="header">
    <h1>
        <a href="index.php">CSSEC's Blog</a>
    </h1>
</header>

<main class="main">
    <div class="article-header">
        <a href="index.php" class="back-link"><< 返回</a>
        <h2 class="article-title"><?php echo $article['title']; ?></h2>
        <p class="article-ctime"><?php echo $article['created_at']; ?></p>
    </div>
    <p class="article-content"><?php echo $article['content']; ?></p>
</main>

<section class="footer">
    &copy; 2024 <a href="https://www.yuque.com/cssec/wiki" target="_blank" rel="noopener noreferrer">CSSEC</a>
</section>
</body>
</html>
