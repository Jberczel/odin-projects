
var squaresPerRow = 8;

$(document).ready(function(){

	createGrid(squaresPerRow);
});

$("button").click(function(){
	$(".square").remove();

	squaresPerRow = parseInt(prompt("How many squares per side (min:1;max:64)?",8),10);
	if (squaresPerRow > 0 && squaresPerRow <= 64)
	{
		createGrid(squaresPerRow);
	
	}
	else
	{
		alert("Sorry that was not a valid input.");
	}

	
});


function createGrid(numSquares) {
	$grid = $('.grid');
	for(var i  = 0; i < numSquares * numSquares; i++)
	{
		$grid.append("<div class='square'></div>");			
	}

	var width = $(".container").width() / squaresPerRow;  
	$(".square").css({"width":width ,"height":width});	

	$(".square").mouseenter(function(){
		$(this).addClass("blue");
	});

};

