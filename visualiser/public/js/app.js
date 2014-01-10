
function Visualiser() {


	this.restfulURL = 'http://localhost:4567';

	this.test = function() {
   	   $('#messages').text('test');
	};
	
	this.getRestfulData = function(urlString){
	
	   var url = this.restfulURL + urlString;
	   $.getJSON( url, function( json ){
	       var source = $('#phases-template').html();
	       var template = Handlebars.compile(source);
		$('#template-div').html(template(json));
		//console.log($('#template-div').html());
	   });
	};

	this.showLevelData = function(data){
		//console.log(data);
     		//this.efos = this.getDataForElements(domEls);
                //this.containers = document.querySelectorAll('.flash-container');
    		$('.expandableLevelData').toggle();
	};

	this.getLevelsFromUID = function(data){
		var aData = data.innerHTML.split(':');
			
		console.log(aData[1].replace(/\s/g, ''));
		this.getRestfulData('/education/levels/'+ aData[1].replace(/\s/g, ''));
	}

};

var visualGuide = new Visualiser;
visualGuide.test();
visualGuide.getRestfulData('/education/phases');

