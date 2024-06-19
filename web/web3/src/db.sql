-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: web3
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Database: `web3`
--
DROP DATABASE IF EXISTS `web3`;
CREATE DATABASE IF NOT EXISTS `web3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `web3`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles`
(
    `id`         int(6) unsigned NOT NULL AUTO_INCREMENT,
    `title`      varchar(30)     NOT NULL,
    `content`    text            NOT NULL,
    `created_at` timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles`
    DISABLE KEYS */;
INSERT INTO `articles`
VALUES (1, 'SQL 注入',
        '内容来自 <a style=\"color: #0000FF;\" href=\"https://ctf-wiki.org/web/sqli/?h=sqlm#_1\" target=\"_blank\">https://ctf-wiki.org/web/sqli/?h=sqlm#_1</a>\n\n<pre>\n\n基本概念 ¶\nSQL 注入是一种将 SQL 代码插入或添加到应用（用户）的输入参数中，之后再将这些参数传递给后台的 SQL 服务器加以解析并执行的攻击。\n攻击者能够修改 SQL 语句，该进程将与执行命令的组件（如数据库服务器、应用服务器或 WEB 服务器）拥有相同的权限。\n如果 WEB 应用开发人员无法确保在将从 WEB 表单、cookie、输入参数等收到的值传递给 SQL 查询（该查询在数据库服务器上执行）之前已经对其进行过验证，通常就会出现 SQL 注入漏洞。\n\n常用工具 ¶\nBurp Suite：Burp Suite 使用介绍\nTamper Data (Firefox addon)\nHackBar (Firefox addon)\nsqlmap：sqlmap 用户手册\n注入常见参数 ¶\nuser()：当前数据库用户\ndatabase()：当前数据库名\nversion()：当前使用的数据库版本\n@@datadir：数据库存储数据路径\nconcat()：联合数据，用于联合两条数据结果。如 concat(username,0x3a,password)\ngroup_concat()：和 concat() 类似，如 group_concat(DISTINCT+user,0x3a,password)，用于把多条数据一次注入出来\nconcat_ws()：用法类似\nhex() 和 unhex()：用于 hex 编码解码\nload_file()：以文本方式读取文件，在 Windows 中，路径设置为 \\\\\nselect xxoo into outfile \'路径\'：权限较高时可直接写文件\n\n......\n</pre>',
        '2024-06-18 15:56:12'),
       (2, 'sqlmap用户手册',
        '内容来自 <a style=\"color: #0000FF;\" href=\"http://drops.xmd5.com/static/drops/tips-143.html\" target=\"_blank\">http://drops.xmd5.com/static/drops/tips-143.html</a>\n\n<pre>\n\nhttp://192.168.136.131/sqlmap/mysql/get_int.php?id=1\n\n当给sqlmap这么一个url的时候，它会：\n\n1、判断可注入的参数\n\n2、判断可以用那种SQL注入技术来注入\n\n3、识别出哪种数据库\n\n4、根据用户选择，读取哪些数据\nsqlmap支持五种不同的注入模式：\n\n1、基于布尔的盲注，即可以根据返回页面判断条件真假的注入。\n\n2、基于时间的盲注，即不能根据页面返回内容判断任何信息，用条件语句查看时间延迟语句是否执行（即页面返回时间是否增加）来判断。\n\n3、基于报错注入，即页面会返回错误信息，或者把注入的语句的结果直接返回在页面中。\n\n4、联合查询注入，可以使用union的情况下的注入。\n\n5、堆查询注入，可以同时执行多条语句的执行时的注入。\nsqlmap支持的数据库有：\n\nMySQL, Oracle, PostgreSQL, Microsoft SQL Server, Microsoft Access, IBM DB2, SQLite, Firebird, Sybase和SAP MaxDB\n可以提供一个简单的URL，Burp或WebScarab请求日志文件，文本文档中的完整http请求或者Google的搜索，匹配出结果页面，也可以自己定义一个正则来判断那个地址去测试。\n\n测试GET参数，POST参数，HTTP Cookie参数，HTTP User-Agent头和HTTP Referer头来确认是否有SQL注入，它也可以指定用逗号分隔的列表的具体参数来测试。\n\n可以设定HTTP(S)请求的并发数，来提高盲注时的效率。\n\nYoutube上有人做的使用sqlmap的视频：\n\nhttp://www.youtube.com/user/inquisb/videos\n\nhttp://www.youtube.com/user/stamparm/videos\n\n使用sqlmap的实例文章：\n\nhttp://unconciousmind.blogspot.com/search/label/sqlmap\n\n可以点击https://github.com/sqlmapproject/sqlmap/tarball/master下载最新版本sqlmap。\n\n也可以使用git来获取sqlmap\n\ngit clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev\n之后可以直接使用命令来更新\n\npython sqlmap.py --update\n或者\n\ngit pull\n更新sqlmap\n\n如果你想观察sqlmap对一个点是进行了怎样的尝试判断以及读取数据的，可以使用-v参数。\n\n共有七个等级，默认为1：\n\n0、只显示python错误以及严重的信息。\n\n1、同时显示基本信息和警告信息。（默认）\n\n2、同时显示debug信息。\n\n3、同时显示注入的payload。\n\n4、同时显示HTTP请求。\n\n5、同时显示HTTP响应头。\n\n6、同时显示HTTP响应页面。\n如果你想看到sqlmap发送的测试payload最好的等级就是3。\n\n......\n</pre>',
        '2024-06-18 15:56:12'),
       (3, 'CTF 历史',
        '内容来自 <a style=\"color: #0000FF;\" href=\"https://ctf-wiki.org/introduction/history/\" target=\"_blank\">https://ctf-wiki.org/introduction/history/</a>\n\n<pre>\n\n本栏内容摘自诸葛建伟老师在 i 春秋上的公开视频「The Past, Present and Future of CTF」。\n\nCTF 的起源 ¶\nCTF 的前身是传统黑客之间的网络技术比拼游戏，起源于 1996 年第四届 DEFCON。\n\n早期 CTF 竞赛 ¶\n第一个 CTF 比赛（1996 年 - 2001 年），没有明确的比赛规则，没有专业搭建的比赛平台与环境。由参赛队伍各自准备比赛目标（自行准备与防守比赛目标，并要尝试攻破对方的比赛目标）。而组织者大都只是一些非专业的志愿者，接受参赛队伍手工计分的请求。\n\n没有后台自动系统支持和裁判技术能力认定，计分延迟和误差以及不可靠的网络和不当的配置，导致比赛带来了极大的争论与不满。\n\n「现代」CTF 竞赛 ¶\n由专业队伍承担比赛平台、命题、赛事组织以及自动化积分系统。参赛队伍需提交参赛申请，由 DEFCON 会议组织者们进行评选。\n\n就 LegitBS 组织的三年 DEFCON CTF 比赛而言，有以下突出特点：\n\n比赛侧重于对计算机底层和系统安全的核心能力，Web 漏洞攻防技巧完全被忽略。\n竞赛环境趋向多 CPU 指令架构集，多操作系统，多编程语言。\n采用「零和」计分规则。\n团队综合能力考验：逆向分析、漏洞挖掘、漏洞利用、漏洞修补加固、网络流量分析、系统安全运行维护以及安全方面的编程调试。\n\n......\n</pre>',
        '2024-06-18 15:56:12'),
       (4, 'HTTP 消息结构',
        '内容来自 <a style=\"color: #0000FF;\" href=\"https://www.runoob.com/http/http-messages.html\" target=\"_blank\">https://www.runoob.com/http/http-messages.html</a>\n\n<pre>\n\nHTTP 消息结构\nHTTP 是基于客户端/服务端（C/S）的架构模型，通过一个可靠的链接来交换信息，是一个无状态的请求/响应协议。\n\nHTTP 消息是客户端和服务器之间通信的基础，它们由一系列的文本行组成，遵循特定的格式和结构。\n\nHTTP消息分为两种类型：请求消息和响应消息。\n\n一个 HTTP 客户端是一个应用程序（Web 浏览器或其他任何客户端），通过连接到服务器达到向服务器发送一个或多个 HTTP 的请求的目的。\n\n一个 HTTP 服务器 同样也是一个应用程序（通常是一个 Web 服务，如 Nginx、Apache 服务器或 IIS 服务器等），通过接收客户端的请求并向客户端发送 HTTP 响应数据。\n\n<img src=\"https://www.runoob.com/wp-content/uploads/2013/11/231-O-Que-E-Request-E-Response-02.jpg\" alt=\"HTTP 消息结构\" />\n\n......\n</pre>',
        '2024-06-18 15:56:12'),
       (5, 'User-Agent',
        '内容来自 <a style=\"color: #0000FF;\" href=\"https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/User-Agent\" target=\"_blank\">https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/User-Agent</a>\n\n<pre>\n\nUser-Agent 请求标头是一个特征字符串，使得服务器和对等网络能够识别发出请求的用户代理的应用程序、操作系统、供应商或版本信息。\n\n警告： 请阅读 <a style=\"color: #0000FF;\" href=\"https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Browser_detection_using_the_user_agent\" target=\"_blank\">使用用户代理字段进行浏览器检测</a> 来了解为什么为不同的浏览器提供不同的页面或者服务通常不是一个好主意。\n\n语法\nHTTP\nCopy to Clipboard\nUser-Agent: <product> / <product-version> <comment>\nweb 浏览器的通用格式为：\n\nHTTP\nCopy to Clipboard\nUser-Agent: Mozilla/5.0 (<system-information>) <platform> (<platform-details>) <extensions>\n\n......\n</pre>',
        '2024-06-18 15:56:12');
/*!40000 ALTER TABLE `articles`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19  0:18:11
