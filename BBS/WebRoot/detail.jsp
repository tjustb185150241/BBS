<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
TopicDao topicDao = new TopicDaoImpl();
ReplyDao replyDao = new ReplyDaoImpl();
UserDao userDao = new UserDaoImpl();
int  topicId = 1;
int p = 1;
Topictopic = TopicDao.findTopic(topicId);
UsertopicUser = userDao.findUser(Topic.getUid());
List listReply = replyDao.findListReply(p,topicId);
 %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>看帖</title>
<style>
#apDiv1 {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 800px;
	height: 51px;
	z-index: 1;
	color: #3399cc;
	font-size: 36px;
	font-family: "Comic Sans MS", cursive;
	text-align: center;
}
#apDiv2 {
	position: absolute;
	left: 1px;
	top: 51px;
	width: 800px;
	height: 25px;
	z-index: 2;
	background-color: #e0f0f9;
	color: #3399cc;
	font-size: 12px;
}
#apDiv3 {
	position: absolute;
	left: -3px;
	top: 85px;
	width: 800px;
	height: 25px;
	z-index: 3;
	font-family: "Comic Sans MS", cursive;
}

#apDiv4 {
	position: absolute;
	left: 1px;
	top: 128px;
	width: 800px;
	height: 20px;
	z-index: 4;
}
#apDiv5 {
	position: absolute;
	left: 1px;
	top: 160px;
	width: 800px;
	height: 25px;
	z-index: 5;
}
#apDiv6 {
	position: absolute;
	left: 1px;
	top: 195px;
	width: 799px;
	height: 25px;
	z-index: 6;
	background-color: #e0f0f9;
}
#apDiv7 {
	position: absolute;
	left: 1px;
	top: 232px;
	width: 800px;
	height: 203px;
	z-index: 7;
}
</style>
</head>

<body>
<div id="apDiv1">校园BBS系统</div>
<div id="apDiv2">您尚未 <a href="login.html">登录</a> | <a href="reg.html">注册</a> |</div>
<div id="apDiv3">&gt;&gt;<a href="index.html">论坛首页</a>&gt;&gt;灌水乐园</div>
<div id="apDiv4">
  <form id="form1" name="form1" method="post" action="">
    <input type="submit" name="button" id="button" value="回复帖子" />
    <input type="submit" name="button2" id="button2" value="发表话题" />
  </form>
</div>
<div id="apDiv5">上一页 | 下一页</div>
<div id="apDiv6">本页主题：灌水</div>
<div id="apDiv7"></div>
</body>
</html>

