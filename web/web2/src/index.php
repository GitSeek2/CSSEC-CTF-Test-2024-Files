<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>Todo List</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div id="app"></div>

    <script type="module">
        import App from "./conponents/App.js";

        Vue.createApp(App).mount("#app");
    </script>
</body>

</html>