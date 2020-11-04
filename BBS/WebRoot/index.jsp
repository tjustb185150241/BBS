<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
BoardDao boardDao = new  BoardDaoImpl();
Map mapBoard = boardDao.findBoard();
TopicDao topicDao = new TopicDaoImpl();
UserDao userDao = new UserDaoImpl();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<style type="text/css">

#apDiv1 {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 800px;
	height: 50px;
	z-index: 1;
	font-size: 36px;
	color: #3399cc;
	text-align: center;
	font-family: "Comic Sans MS", cursive;
}
#apDiv2 {
	position: absolute;
	left: 1px;
	top: 51px;
	width: 800px;
	height: 25px;
	z-index: 2;
	background-color: #e0f0f9;
	font-size: 12px;
	color: #3399cc;
	font-family: "黑体";
}
#apDiv3 {
	position: absolute;
	left: 1px;
	top: 76px;
	width: 800px;
	height: 500px;
	z-index: 3;
	font-size: 12px;
	color: #004c7d;
}
</style>
</head>

<body>
<div id="apDiv1">校园BBS系统</div>
<div id="apDiv2">您尚未 <a href="login.html">登录 </a>| <a href="reg.html">注册</a> |</div>
<div id="apDiv3">
  <table width="800" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="2">论坛</td>
      <td>主题</td>
      <td>最后发表</td>
    </tr>
    <!--主版块 开始 -->
    <%
    List listMainBoard = (List)mapBoard.get(new Integer(0));
    for(int i=0;i<listMainBoard.size();i++){
    	Board mainBoard = ((Board)listMainBoard.get(i));
     %>
    <tr>
      <td colspan="4"><%= mainBoard.getBoardName() %></td>
    </tr>
    <!-- 子版块开始 -->
    <%
    	List listSonBoard = (List)mapBoard.get(new Integer(mainBoard.getBoardId()));
    	for(int j=0;j<listSonBoard.size();j++){
    		Board sonBoard = (Board)listSonBoard.get(j);
    		Topic topic = new Topic();
    		User user = new User();
    		int boardId = sonBoard.getBoardId();
    		List listTopic = topicDao.findListTopic(1,boardId);
    		if(listTopic!=null && listTopic.size()>0){
    			topic = (Topic)listTopic.get(0);
    			user = userDao.findUser( topic.getUid());
    		}
    	
    %>
    <tr>
      <td>&nbsp;</td>
      <td><%= sonBoard.getBoardName() %></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <!-- 子版块结束 -->
	<%
		}
	%>
    
   <!-- 主版块结束 -->
   <%
   }
   %>
   
  </table>
</div>
</body>
</html>
