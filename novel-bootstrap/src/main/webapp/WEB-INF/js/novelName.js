
var novelName ;
$(function(){
	var novelName = $('#novelName').value;

    function invokeSearch(){
		if(name != '' && name !='undefined'){
		alert('搜索名字: ' + name);
		console.info(name);
		searchNovelByName();
			}
    }
 	function searchNovelByName(){
    		$.ajax({
    			url:'<%=path%>/novel/nameSearch/key.do',
    			dataType:'json',
    			asyn:false,
    			type:'GET',
    			data:{
    				keyword : name
    			},
    			success : function(data){
    				//$('#search-json-result').setText(data);
    				console.info(data);
    			}
    		})
	
	}
	
})