<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Siang</title>
    <link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
    
    <!-- 珥덇린�솕 -->
    <style>
    	* { margin:0; padding:0;}
    	body { font-family: 'Times New Roman', serif; }
    	li { list-style: none; }
    	a { text-decoration: none; }
    	img { border:0; }
    </style>
    
    <!-- �뿤�뜑 -->
    <style>
    	#main_header {
    	
    		width: 960px;
    		margin: 0 auto;
    	
    		height: 160px;
    		position: relative;
    	}
    	#main_header > #title{
    		position: absolute;
    		left: 20px; top: 30px;
    		
    		
    	}
    	#main_header > #main_gnb{
    		position: absolute;
    		right: 0; top: 0;
    	}
    	#main_header > #main_lnb{
    		position: absolute;
    		right: 0; bottom: 10px;
    	}
    	#login {
    	position: absolute;
    		right: 0; bottom: 90px;
    	}
    
    </style>
    
    <!-- ���씠�� -->
    <style>
    	#title {
    		font-family: 'Indie Flower', cursive;
    	}
    </style>
    
    <!-- 硫붾돱(1) -->
    <style>
    	#main_gnb > ul {overflow: hidden;}
    	#main_gnb > ul > li { float: left;}
    	#main_gnb > ul > li > a {
    		display: block;
    		padding: 2px 10px;
    		border:1px solid black;
    	}
    	#main_gnb > ul > li > a:hover {
    		background:black;
    		color: white;
    	}
    	#main_gnb > ul > li:first-child > a {border-radius:10px 0 0 10px;}
    	#main_gnb > ul > li:last-child > a {border-radius:0 10px 10px 0;}
    
    </style>
    
    <!-- 硫붾돱(2) -->
    <style>
    	#main_lnb > ul {overflow: hidden;}
    	#main_lnb > ul > li { float: left;}
    	#main_lnb > ul > li > a {
			display: block;
    		padding: 10px 20px;
    		border:1px solid black;
    	}
    	#main_lnb > ul > li > a:hover {
    		background:black;
    		color: white;
    	}
    	#main_lnb > ul > li:first-child > a {border-radius:10px 0 0 10px;}
    	#main_lnb > ul > li:last-child > a {border-radius:0 10px 10px 0;}
    
    	
    </style>
    
    <!-- 肄섑뀗痢� -->
    <style>
    	#content {
    		width:960px;
    		margin: 0 auto;
    		
    		overflow:hidden;
    	}
    	
    	#content > #main_section {
    		width:750px;
    		float:left;
    	}
    	
    	#content > #main_aside {
    		width:200px;
    		float:right;
    	}
    	
    </style>
    
    <!-- 蹂몃Ц -->
    <style>
    	#main_section > article.main_article {
    		margin-bottom:10px;
    		padding:20px;
    		border:1px solid black;
    	}
    </style>
    
    <!-- �궗�씠�뱶 -->
    <style>
    	input:nth-of-type(1) { display:none;}
    	input:nth-of-type(1) ~ div:nth-of-type(1){ display: none;}
    	input:nth-of-type(1):checked ~ div:nth-of-type(1) { display:block;}
    	
    	input:nth-of-type(2) { display:none;}
    	input:nth-of-type(2) ~ div:nth-of-type(2){ display: none;}
    	input:nth-of-type(2):checked ~ div:nth-of-type(2) { display:block;}
    	
    	section.buttons { overflow: hidden;}
    	section.buttons > label {
    		display: block; float: left;
    		
    		width: 100px; height: 30px;
    		line-height:30px;
    		text-align:center;
    		
    		box-sizing: border-box;
    		border: 1px solid black;
    		
    		background: black;
    		color:white;
    	
    	}
    	input:nth-of-type(1):checked ~ section.buttons > label:nth-of-type(1) {
    		background: white;
    		color: black;
    	}
    	input:nth-of-type(2):checked ~ section.buttons > label:nth-of-type(2) {
    		background: white;
    		color: black;
    	}
    
    </style>
    
    <!-- 紐⑸줉 -->
    <style>
    	.item {
    		overflow: hidden;
    		padding: 10px;
    		border: 1px solid black;
    		border-top: none;
    	}
    	
    	.thumbnail {
    		float: left;
    	}
    	
    	.description {
    		float: left;
    		margin-left: 10px;
    	}
    	.description > strong {
    		display: block;
    		width:120px;
    		white-space: nowrap;
    		overflow:hidden;
    		text-overflow:ellipsis;
    	}
    
    </style>
    
    <!-- �뫖�꽣 -->
    <style>
    	#main_footer {
    	width:960px; margin:0 auto;
    	margin-bottom:10px;
    	
    	box-sizing: border-box;
    	padding:10px;
    	border:1px solid black;
    	
    	text-align:center;
    </style>
    
</head>
<% request.setCharacterEncoding("euc-kr"); %>
<%
Object mem_name = session.getAttribute("member_name");
Object mem_id = session.getAttribute("member_id");
session.setAttribute("member_id", mem_id);

%>
<body>
    <header id="main_header">
    	<div id="title">
    		<h1>Rint Development</h1>
    		<h2>HTML5 + CSS3 Basic</h2>
    	</div>
    	<nav id="main_gnb">
    		<ul>
    			<li><a href="#">Web</a></li>
    			<li><a href="#">Mobile</a></li>
    			<li><a href="#">Game</a></li>
    			<li><a href="#">Simulation</a></li>
    			<li><a href="#">Data</a></li>
    		</ul>
    	</nav>
    	<nav id="login">
    	<%if(mem_name==null){    %>
    		<a href="left_Frame.jsp" >Login</a><br>
    		<%} else { %>
    		<h3> user :  <%=mem_name %> </h3>
    		<a href="logout.jsp">logout</a>
    		<%} %>
    	</nav>
    	<nav id="main_lnb">
    		<ul>
    			<li><a href="#">HTML5</a></li>
    			<li><a href="#">CSS3</a></li>
    			<li><a href="#">JavaScript</a></li>
    			<li><a href="#">jQuery</a></li>
    			<li><a href="#">Node.js</a></li>
    		</ul>
    	</nav>
    </header>
    
    <div id="content">
    	<section id="main_section">
    		<article class="main_article">
    			<h1>HelloFam</h1>
    			<p>HelloDad HelloMom HelloPororri HelloSun HelloPato</p>
    		</article>
    		<article class="main_article">
    			<h1>HelloFam</h1>
    			<p>HelloDad HelloMom HelloPororri HelloSun HelloPato</p>
    		</article>
    		<article class="main_article">
    			<h1>HelloFam</h1>
    			<p>HelloDad HelloMom HelloPororri HelloSun HelloPato</p>
    		</article>
    		
    	
    	</section>
    	<aside id="main_aside">
    		<input id="first" type="radio" name="tab" checked="checked" />
    		<input id="second" type="radio" name="tab"/>
    		<section class="buttons">
    			<label for="first">First</label>
    			<label for="second">Second</label>
    		</section>
    		<div class="tab_item">
    			<ul>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>HTML5 Canvas</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>HTML5 Audio</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>HTML5 Video</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>HTML Semantic Web</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    			</ul>
    		</div>
    		<div class="tab_item">
    			<ul>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>CSS3 Transition</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>CSS3 Animation</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>CSS3 Border</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    				<li class="item">
	    				<a href="#">
	    					<div class="thumbnail">
	    						<img src="http://placehold.it/45x45" />
	    					</div>
	    					<div class="description">
	    						<strong>CSS3 Box</strong>
	    						<p>2012-03-15</p>
	    					</div>
	    				</a>
    				</li>
    			</ul>
    		
    		</div>
    	</aside>
    </div>
    <footer id="main_footer">
    	<h3>HTML5 + CSS3 Basic</h3>
    	<address>Wdbsite Layout Basic</address>
    </footer>
    
</body>
</html>