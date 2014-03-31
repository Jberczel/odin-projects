
//deafult number of squares
var squaresPerRow = 8;


//when the document is ready, create grid using JQuery
$(document).ready(function(){

	//see helper funciton on line 32
	createGrid(squaresPerRow,false);
});

$("button").click(function(){

	$(".square").remove();

	//get number of squares from user and data validaiton
	squaresPerRow = parseInt(prompt("How many squares per side (min:1;max:64)?",8),10);
	if (squaresPerRow > 0 && squaresPerRow <= 64)
	{
		createGrid(squaresPerRow, true);
	
	}
	else
	{
		alert("Sorry that was not a valid input.");
	}
	
	
});

//helper function to build square grid 
// parameters for number of squares per row and whether using random color generator
function createGrid(numSquares,isColor) {
	
	//build square grid based on input from user
	$grid = $('.grid');
	for(var i  = 0; i < numSquares * numSquares; i++)
	{
		$grid.append("<div class='square'></div>");			
	}

	//resize squares to fit within container
	var width = $(".container").width() / squaresPerRow;  
	$(".square").css({"width":width ,"height":width});	

	//anytime mouse enters one of squares, change color
	$(".square").mouseenter(function(){

		if (isColor) {
			$(this).css("background-color", getColor());
		}
		else {
			$(this).addClass("marked");
		}
	});

};

//helper function to generate random colors
function getColor() {
	var red = Math.floor((Math.random()*255)+1);
	var green = Math.floor((Math.random()*255)+1);
	var blue = Math.floor((Math.random()*255)+1);
	return "rgb(" + red + "," + green + "," + blue + ")";

	}






