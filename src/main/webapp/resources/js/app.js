function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}

$(function() {
	/*==================================================================
    [ youtubeApi ]*/
    $('form#searchForm').submit(function(e){
    	console.log("누름");
       e.preventDefault();
       // prepare the request
       var request = gapi.client.youtube.search.list({
            part: "snippet",
            type: "video",
            q: encodeURIComponent('버킷리스트').replace(/%20/g, "+"), //$("#search").val()
            maxResults: 3,
            order: "viewCount",
            publishedAfter: "2015-01-01T00:00:00Z"
       }); 
       // execute the request
       request.execute(function(response) {
    	   console.log("들어옴");
          var results = response.result;
          $("#results").html("");
          console.log(results.items);
          $.each(results.items, function(index, item) {
            $.get("item.html", function(data) {
                $("#results").append(tplawesome("", [{"title":item.snippet.title, "videoid":item.id.videoId}]));
            });
          });
          resetVideoHeight();
       });
    });
    
    $(window).on("resize", resetVideoHeight);
});

function resetVideoHeight() {
    $(".video").css("height", $("#results").width() * 9/16);
}

function init() {
    gapi.client.setApiKey("AIzaSyC84h4GkWmaBXYp331jIjYXC4uomOgvayM");
    gapi.client.load("youtube", "v3", function() {
        // yt api is ready
    });
}