<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Bootstrap Buttons Demo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		.main-body{
			background-color:#FAFFF0;
		}
		.mainarea {
			text-align : center;	
		}
		.search {
			margin-top: 50px;
			margin-left:10px;
			padding : 0px;
		}
		
		.inputx {
			margin-right: 30px;
		}
		h3 {
			font-size : 30px;
			color: #abcdef;
			text-align : center;
		}
		.novel-search-text {
			font-size : 20px;
			color:#000;
			margin-right:20px;
		}
		.text-info {
			margin-top : 100px;
		}
		
		.novel-name-search-result {
			font-size : 18px;
		}
		
		.text-area-json-result {
			font-size : 12px;
		}
	</style>
	<!-- 添加jq库 -->
	<script type="text/javascript" src="<%=basePath%>common/js/jquery/jquery.min.js"></script>
	<!-- 添加bootstrap的css -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>common/css/bootstrap/bootstrap.min.css">
    <!-- 添加bootstrapjs库-->
    <script type="text/javascript" src="<%=basePath%>/common/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>common/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    	var srest;
  		if(name != '' && name !='undefined'){
    		alert('搜索名字: ' + name);
    		console.info(name);
  		}
     	function searchNovelByNameByAjax(){
        		$.ajax({
        			url:'<%=path%>/novel/nameSearch/key.do',
        			dataType:'json',
        			type:'GET',
        			data:{
        				keyword : encodeURI('永夜君王')
        			},
        			success : function(data){
//         				$('#search-json-result').innerText= data.showapi_res_body;
        				document.getElementById('search-json-result').innerText = data.showapi_res_body.pagebean.contentlist[0].author;
        				console.info(data);
        			}
        		})
    	
    	}	
     	function searchNovelByNameByGet(){
//      		var name = $('#novelName').value;
			var input = document.getElementById('novelName');
			var name = input.value;
//      		alert('搜索名字: ' + name);
     		if(name != '' && name !='undefined'){
     			document.getElementById('search-json-result').value = '';	
        		$.get('<%=path%>/novel/nameSearch/key.do',{
         			keyword : encodeURI(name)	
         		},function(data,status){
//          			document.getElementById('search-json-result').innerText = data.showapi_res_body.pagebean.contentlist[0].author;
         			document.getElementById('search-json-result').value = formatJSON(data);
         			console.info(formatJSON(data));
         		});
      		}
     		
     	}
    	//json格式化方法
     	function formatJSON(json,options){
     		var reg = null,
     		 formatted = '',
     		 pad = 0,
     		 PADDING = ''; 
     		 //one can also use '\t' or a different number of spaces
     		 // optional settings
     		 options = options || {};
     		 // remove newline where '{' or '[' follows ':'
     		 options.newlineAfterColonIfBeforeBraceOrBracket = (options.newlineAfterColonIfBeforeBraceOrBracket === true) ? true : false;
     		 // use a space after a colon
     		 options.spaceAfterColon = (options.spaceAfterColon === false) ? false : true;
     		 // begin formatting...
     		 if (typeof json !== 'string') {
     		 // make sure we start with the JSON as a string
     		 json = JSON.stringify(json);
     		 } else {
     		 // is already a string, so parse and re-stringify
     		 //in order to remove extra whitespace
     		 json = JSON.parse(json);
     		 json = JSON.stringify(json,null,2);
     		 }
     		 // add newline before and after curly braces
     		 reg = /([\{\}])/g;
     		 json = json.replace(reg, '$1\r\n');
     		 // add newline before and after square brackets
     		 reg = /([\[\]])/g;
     		 json = json.replace(reg, '\r\n\t$1\r\n');
     		 // add newline after comma
     		 reg = /(\,)/g;
     		 json = json.replace(reg, '$1\r\n');
     		 // remove multiple newlines
     		 reg = /(\r\n\r\n)/g;
     		 json = json.replace(reg, '\r\n');
     		 // remove newlines before commas
     		 reg = /\r\n\,/g;
     		 json = json.replace(reg, ',');
     		 // optional formatting...
     		 if (!options.newlineAfterColonIfBeforeBraceOrBracket) { 
     		 reg = /\:\r\n\{/g;
     		 json = json.replace(reg, ':{');
     		 reg = /\:\r\n\[/g;
     		 json = json.replace(reg, ':[');
     		 }
     		 if (options.spaceAfterColon) {  
     		 reg = /\:/g;
     		 json = json.replace(reg, ': ');
     		 }
     		 $.each(json.split('\r\n'), function(index, node) {
     		 var i = 0,
     		  indent = 0,
     		  padding = '';
     		 if (node.match(/\{$/) || node.match(/\[$/)) {
     		  indent = 1;
     		 } else if (node.match(/\}/) || node.match(/\]/)) {
     		  if (pad !== 0) {
     		  pad -= 1;
     		  }
     		 } else {
     		  indent = 0;
     		 }
     		 for (i = 0; i < pad; i++) {
     		  padding += PADDING;
     		 }
     		 formatted += padding + node + '\r\n';
     		 pad += indent;
     		 });
     		 return formatted;
     	}
    
    </script>
  </head>
  
  <body class="main-body">
  <h3 ><span class="glyphicon glyphicon-align-center "></span>简易小说搜索引擎</h3>
  <hr/>
  <div class="mainarea">
  	<div class="search">
  	<label class="novel-search-text">搜索栏 : </label>
   	<input type="text" class="bg-success inputx " placeholder="输入要搜索的小说名字" style="width:300px;height:30px;" name="novelName" id="novelName"/>
 	<button type="button" class="btn btn-success" style="width:100px;" onclick="searchNovelByNameByGet();">查询&nbsp;<span class="glyphicon glyphicon-search"></span></button>
  </div> 
  
  <div class="text-info">
  	<label class="search-result-info"><span class="glyphicon glyphicon-link"></span>**--:通过搜索小说名字查询json格式的小说详细内容。</label><br/>
  	<label class="novel-name-search-result"><span class="glyphicon glyphicon-screenshot"></span>搜索结果:</label>
  	<textarea rows="30" cols="100" id="search-json-result" class="text-area-json-result"></textarea>
  </div>
  </div>
  
  </body>
</html>
