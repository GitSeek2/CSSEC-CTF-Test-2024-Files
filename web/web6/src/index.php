<?php
$img_path = null;
$upload_path = './uploads';

if (!file_exists($upload_path)) {
    mkdir($upload_path);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $temp_file = $_FILES['upload_file']['tmp_name'];
    $temp = explode(".", $_FILES['upload_file']['name']);
    $new_file_name = date('YmdHis') . '.' . end($temp);
    $img_path = $upload_path . '/' . $new_file_name;
    if (move_uploaded_file($temp_file, $img_path)) {
        echo json_encode(['status' => 'success', 'path' => $img_path]);
    } else {
        echo json_encode(['status' => 'error', 'message' => '上传出错！']);
    }
    exit();
}
?>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人信息</title>
    <style>
        .container {
            text-align: center;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        form {
            margin-bottom: 20px;
            display: flex;
            flex-direction: row;
            justify-content: center;

        }

        #icon {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border: 1px solid #ddd;
            padding: 5px;
        }
    </style>
</head>
<body>
<section class="container">
    <h2>Who Am I</h2>
    <form enctype="multipart/form-data" method="post" id="uploadForm" onsubmit="return checkFile()">
        <input type="file" name="upload_file" id="uploadFile" accept="image/jpeg,image/png,image/gif">
        <input class="button" type="submit" name="submit" value="上传">
    </form>
    <div id="msg"></div>
    <div id="img"><img src="./uploads/whoami.png" alt="icon" id="icon"></div>

    <script>
        function checkFile() {
            // 检查文件类型
            const file = document.getElementById('uploadFile').files[0];
            const msgElement = document.getElementById('msg');
            if (!file) {
                msgElement.textContent = '请选择文件';
                return false;
            }
            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            const fileType = file.type;
            if (!allowedTypes.includes(fileType)) {
                msgElement.textContent = '只能上传 jpg、png、gif 格式的图片';
                return false;
            }
            // 如果文件类型正确，清空错误消息
            msgElement.textContent = '';
            return true;
        }

        document.getElementById('uploadFile').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) { // 如果选择了文件，就显示预览
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('img').innerHTML = '<img src="' + e.target.result + '" id="icon" alt="icon">';
                };
                reader.readAsDataURL(file);
            }
        });

        document.getElementById('uploadForm').addEventListener('submit', function (event) {
            event.preventDefault();
            if (!checkFile()) {
                return;
            }
            const formData = new FormData(event.target);
            fetch('index.php', {
                method: 'POST',
                body: formData,
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        document.getElementById('msg').textContent = 'Maybe you are hacker';
                        document.getElementById('img').innerHTML = '<img src="' + data.path + '" id="icon" alt="icon">';
                    } else {
                        document.getElementById('msg').textContent = data.message;
                    }
                });
        });
    </script>
</section>
</body>
</html>