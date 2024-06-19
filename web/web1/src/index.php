<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>本来无一物</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+SC:wght@200..900&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }

        .proverbs {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            font-family: "Noto Serif SC", serif;
            font-optical-sizing: auto;
            font-style: normal;
        }

        #flag {
            position: absolute;
            bottom: 0;
            color: #f0f0f0;
        }
    </style>
</head>

<body>
    <section class="proverbs">
        <h2>本来无一物，何处惹尘埃。</h2>
        <p id="flag">flag{this_is_a_sample_flag}</p>
    </section>

    <script>
        // 禁用右键
        document.oncontextmenu = function () {
            return false;
        }

        // 禁用 F12，Ctrl + Shift + I，Ctrl + U
        document.onkeydown = function (event) {
            // 获取事件对象
            event = event || window.event;
            // 禁用 F12
            if (event.keyCode == 123) {
                return false;
            }
            // 禁用 Ctrl + Shift + I
            if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
                return false;
            }
            // 禁用 Ctrl + U
            if (event.ctrlKey && event.keyCode == 85) {
                return false;
            }
        }
    </script>
</body>

</html>