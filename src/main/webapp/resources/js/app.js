/*function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}*/

$(function() {
	/*==================================================================
    [ youtubeApi ]*/
    $('form#searchForm').submit(function(e){
    	e.preventDefault();
       	var keyword= $('input[name="searchKeyword"]').val(); 
       	console.log(keyword);
       	if(keyword==null)
       		console.log("null임");
       	else
       		console.log("null아님");
       	// prepare the request
        var request = gapi.client.youtube.search.list({
             part: "snippet",
             type: "video",
             q: keyword,
             maxResults: 1,
             order: "relevance"
        }); 
       // execute the request
       request.execute(function(response) {
    	   console.log(response);
    	   var results = response.result;
    	   $("#results").html("");
    	   $.each(response.items, function(index, item){
    		   $("#results").append(
    				   '<iframe width="440" height="260" src="//www.youtube.com/embed/'+item.id.videoId+'" frameborder="0"></iframe>'
    				   +'<h5>'+item.snippet.title+'</h5>');
    	   });
          /*$("#results").html("");
          $.each(results.items, function(index, item) {
            $.get("resources/item.html", function(data) {
                $("#results").append(tplawesome("", [{"title":item.snippet.title, "videoid":item.id.videoId}]));
            });
          });
          resetVideoHeight();*/
       });
    });
    
    //$(window).on("resize", resetVideoHeight);
});

/*function resetVideoHeight() {
    $(".video").css("height", $("#results").width() * 9/16);
}*/

function init() {
    gapi.client.setApiKey("AIzaSyC84h4GkWmaBXYp331jIjYXC4uomOgvayM");
    gapi.client.load("youtube", "v3", function() {
        // yt api is ready
    });
}