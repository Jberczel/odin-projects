
var count = 4;

$(document).ready(function(){



	for(var i  = 0; i < count*count; i++)
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

		count = prompt("How many squares per side?",4);

		$(".square").remove();

		


		for(var i  = 0; i < count*count; i++)
		{
		$('.grid').append("<div></div>");	
		$('.grid > div').addClass('square');
		}

		var width = 400 / count;
		var height = 400 / count;
		$(".square").css({"width":width ,"height":height});
		console.log("hello");

		$(".square").hover(function(){
		$(this).addClass("blue");
		});


		

	});