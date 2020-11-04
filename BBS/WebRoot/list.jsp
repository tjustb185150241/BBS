<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	TopicDao topicDao = new TopicDaoImpl();
	ReplyDao replyDao = new ReplyDaoImpl();
	UserDao userDao = new UserDaoImpl();
	
	int boardId = 9;
	int p = 1;
	List listTopic = topicDao.findListTopic(p,boardId);
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帖子列表</title>
<style type="text/css">
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
	left: -4px;
	top: 124px;
	width: 800px;
	height: 500px;
	z-index: 4;
}
#apDiv4 #form1 p {
	font-family: "Comic Sans MS", cursive;
	color: #3399cc;
}
#apDiv4 table tr td {
	text-align: center;
}
</style>
</head>

<body>
<div id="apDiv1">校园BBS系统</div>
<div id="apDiv2">您尚未 <a href="login.html">登录</a> | <a href="reg.html">注册</a> |</div>
<div id="apDiv3">&gt;&gt;<a href="index.html">论坛首页</a>&gt;&gt;灌水乐园</div>
<div id="apDiv4">
  <form id="form1" name="form1" method="post" action="">
    <p>
      <input type="submit" name="发表话题" id="发表话题" value="发表话题" />
    </p>
    <p><a href="list.html">上一页</a> | <a href="list.html">下一页</a></p>
  </form>
  <table width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="4" bgcolor="#e0f0f9">&nbsp;</td>
    </tr>
    <!-- 表头 -->
    <tr>
      <td colspan="2">文章</td>
      <td>作者</td>
      <td>回复</td>
    </tr>
    <!-- 主题列表 -->
    <%
    	for(int i=0;i<listTopic.size();i++){
    		Topic topic= (Topic)listTopic.get(i);
    		User user = userDao.findUser(topic.getUid());
     %>
    <tr>
      <td>&nbsp;</td>
      <td><%= topic.getTitle() %></td>
      <td align="center"><%= user.getUName() %></td>
      <td align="center"><%= replyDao.findCountReply(topic.getTopicId()) %></td>
    </tr>
    <%
    }
     %>
   
  </table>
 	<p><a href="list.html">上一页</a> | <a href="list.html">下一页</a></p>
</div>
</body>
</html>
     