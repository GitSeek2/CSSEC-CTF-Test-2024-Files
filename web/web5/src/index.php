<?php
if (isset($_POST['ip'])) {
    $ip = $_POST['ip'];
    $result = shell_exec("ping -c 4 $ip");
    echo $result;
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
    <title>服务监测系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        main {
            text-align: center;
            position: relative;
            background-color: #fff;
            border-radius: 5px;
            padding: 30px;
            width: 450px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: row;
            margin-bottom: 30px;
        }


        input[type="text"] {
            flex: 1;
            padding: 15px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-right: none;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            width: calc(100% - 80px);
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #42b883;
        }

        .button {
            padding: 10px;
            font-size: 18px;
            background-color: #42b883;
            color: #fff;
            border: none;
            cursor: pointer;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            transition: background-color 0.3s;
            width: 80px;
        }

        .button:hover {
            background-color: #42d392;
        }

        #loader {
            border: 5px solid #f3f3f3;
            border-radius: 50%;
            border-top: 5px solid #42b883;
            width: 30px;
            height: 30px;
            animation: spin 1s linear infinite;
            position: fixed;
            top: 50%;
            left: calc(50% - 15px);
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        pre {
            position: fixed;
            top: 80%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<main>
    <h2>服务监测系统</h2>
    <form id="ipForm">
        <input type="text" id="ipInput" placeholder="请输入主机域名或 IP...">
        <input type="submit" value="提交" class="button">
    </form>
    <div id="loader" style="display: none;"></div>
</main>
<pre id="result"></pre>
<script>
    document.getElementById('ipForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const ip = document.getElementById('ipInput').value;
        document.getElementById('loader').style.display = 'block'; // 显示加载动画
        fetch('index.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'ip=' + encodeURIComponent(ip),
        })
            .then(response => response.text())
            .then(data => {
                document.getElementById('loader').style.display = 'none'; // 隐藏加载动画
                document.getElementById('result').textContent = data;
            });
    });
</script>
</body>
</html>