<?php
// 创建 mysql 连接
$host = '127.0.0.1';
$user = 'root';
$pass = 'root';
$dbname = 'web3';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die('连接失败：' . $conn->connect_error);
}

// 不存在 articles 表则创建
$sql = 'CREATE TABLE IF NOT EXISTS articles (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)';

if ($conn->query($sql) !== TRUE) {
    die('创建表失败：' . $conn->error);
}

//// 插入 5 条 fake 文章
//$articles = [
//    ['title' => '文章1', 'content' => '文章1内容'],
//    ['title' => '文章2', 'content' => '文章2内容'],
//    ['title' => '文章3', 'content' => '文章3内容'],
//    ['title' => '文章4', 'content' => '文章4内容'],
//    ['title' => '文章5', 'content' => '文章5内容'],
//];
//
//foreach ($articles as $article) {
//    $title = $article['title'];
//    $content = $article['content'];
//    $sql = "INSERT INTO articles (title, content) VALUES ('$title', '$content')";
//    if ($conn->query($sql) !== TRUE) {
//        die('插入数据失败：' . $conn->error);
//    }
//}
//
//echo '初始化成功';