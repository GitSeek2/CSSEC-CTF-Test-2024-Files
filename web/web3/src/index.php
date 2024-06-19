<?php
// index.php
include_once 'conn.php';
global $conn;
// 查询所有文章（mysql）
$sql = 'SELECT * FROM articles';
$result = $conn->query($sql);
$articles = $result->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSSEC's Blog</title>
    <link rel="stylesheet" href="./assets/style.css">
</head>

<body>
<header class="header">
    <h1><a href="index.php">CSSEC's Blog</a></h1>
</header>

<section class="main">
    <ul class="articles-list">
        <?php foreach ($articles as $article): ?>
            <li class="articles-item">
                <h2 class="articles-title"><?php echo $article['title']; ?></h2>
                <p class="articles-content"><?php echo htmlspecialchars(mb_substr($article['content'], 0, 100, 'utf-8')); ?>
                <div class="articles-meta">
                <span class="ctime">
                    发布时间：<?php echo $article['created_at']; ?>
                </span>
                    <a href="./article.php?id=<?php echo $article['id']; ?>" class="read-link">
                        阅读全文 >>>
                    </a>
                </div>
            </li>
        <?php endforeach; ?>
    </ul>
</section>

<section class="footer">
    &copy; 2024 <a href="https://www.yuque.com/cssec/wiki" target="_blank" rel="noopener noreferrer">CSSEC</a>
</section>
</body>

</html>