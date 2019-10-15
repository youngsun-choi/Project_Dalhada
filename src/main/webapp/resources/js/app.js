function init() {
    gapi.client.setApiKey("AIzaSyBG5O7DQlop-IbBcRZLoMSs5KTHiiVOdlY");
    gapi.client.load("youtube", "v3", function() {
        // yt api is ready
    	makeRequest();
    });
}

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function makeRequest(){
	var keyword= $('input[name="searchKeyword"]').val(); 
	var tagName = getParameterByName('searchTag');
   	if(tagName == "" || tagName == "기타")
   		keyword = (keyword == "") ? "버킷리스트": keyword;
   	else
   		keyword = tagName;
   	// prepare the request
    var request = gapi.client.youtube.search.list({
         part: "snippet",
         type: "video",
         q: keyword,
         maxResults: 1,
         order: "relevance" //관련성
    }); 
   // execute the request
   request.execute(function(response) {
	   console.log(response);
	   var $frag = $(document.createDocumentFragment());
	   $("#results").html("");
	   $.each(response.items, function(index, item){
		   $frag.append(
				   '<iframe class="video w100" width="440" height="260" src="//www.youtube.com/embed/'
				   +item.id.videoId+'?&autoplay=1" frameborder="0" allow="autoplay;"></iframe>'
				   +'<h5>'+item.snippet.title+'</h5>');
	   });
	   $("#results").append($frag);
   });
};
