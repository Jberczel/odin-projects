
var count = 16;

$(document).ready(function(){

	for(var i  = 0; i < count; i++)
	{

		$('.grid').append("<div></div>");
		$('.grid > div').addClass('square');
	}
	

	$(".square").hover(function(){
		$(this).addClass("blue");
	});

	

});





$("button").click(function(){
		$('div').removeClass("blue");

		count = prompt("How many squares per side?",64);


	});