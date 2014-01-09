
function Visualiser() {

	this.restfulURL = 'http://localhost:4567';

	this.test = function(inString) {
   	   $('#canvas').text(inString);
	};
	
	//formatting the data to go to #canvas
	function writeToCanvas(jsonArrayOfHashes, levelName){
		return;
		var canvasString = $('#canvas').html();
		canvasString += '<h2>' + levelName + '</h2>' 
 		$.each(jsonArrayOfHashes, function(key, element) {
			
		canvasString += '<ul class="phases">' 
				 + '<li>id : ' + element.id + '</li>' 
				 + '<li> name : ' + element.name + '</li>' 
				 + '<li> age range : ' + element.lower_age +'-' + element.upper_age + '</li>' 
	//			 + '<li>' + element.levels + '</li>
				 + '</ul>';
				 //+ '<li><ul><li>' + element.levels.length + '</li></ul></li>
        	});
		console.log(canvasString);
		$('#canvas').html(canvasString);

	}

	this.getRestfulData = function(urlString){
	
	   var url = this.restfulURL + urlString;
	   $.getJSON( url, function( json ){
var source = $('#phases-template').html();
var template = Handlebars.compile(source);
		$('#template-div').html(template(json));
		//writeToCanvas(json.phases, 'phases');
		console.log($('#template-div').html());
	   });
	};

};

var visualGuide = new Visualiser;
visualGuide.test();
visualGuide.getRestfulData('/education/phases');



