
//deafult number of squares
var squaresPerRow = 40;


//when the document is ready, create grid using JQuery
$(document).ready(function(){	

	createGrid(squaresPerRow,"black");
});

//clears the current drawing
$(".clear").click(function(){
	$(".square").css({
		"background-color":"#E8E8E8", 
		"opacity":"1"});

});

//creates new Grid with black marker
$(".black").click(function(){
	updateGrid("black");	
});

//creates new grid_label with random color marker
$(".colors").click(function(){
	updateGrid("colors");
});

//creates new grid with gradient marker
$(".opaque").click(function(){
	updateGrid("opaque");

});

//helper function to build square grid 
// parameters for number of squares per row and whether using random color generator
function createGrid(numSquares,option) {
	
	//build square grid based on input from user
	$grid = $('.grid');
	for(var i  = 0; i < numSquares * numSquares; i++)
	{		
		$grid.append("<div class='square'></div>");			
	}

	$(".grid_label").html("Draw by hovering mouse in " + squaresPerRow + " x " + squaresPerRow + " grid below:");

	//resize squares to fit within container
	var width = ($(".container").width())/ squaresPerRow;  
	$(".square").css({"width":width ,"height":width});	

	//anytime mouse enters one of squares, change color
	$(".square").mouseenter(function(){
	

		if (option === "colors") {
			$(this).css("background-color", getColor());
		}
		else if(option === "opaque")
		{
			//reduces opacity by 25% each mouseenter
			$(this).css("opacity", $(this).css("opacity") * 0.75);
		}
		else{
		
			$(this).css("background-color", "black");
		}
	});
};

//deletes old grid (start with clean slate), and then prompts user and creates updated grid
function updateGrid(option){

	$(".square").remove();

	//maintains border after deleting all the squares inside
	//var height = $(".container").width()
	//	$(".grid").css("height",height);

	//get number of squares from user and data validaiton
	squaresPerRow = parseInt(prompt("Enter number of squares (1-64): ",40),10);
	if (squaresPerRow > 0 && squaresPerRow <= 64)
	{

		createGrid(squaresPerRow, option);	
	}
	else
	{
		alert("Sorry that was not a valid input.");
	}	

}

//helper function to generate random colors
function getColor() {
	var red = Math.floor((Math.random()*255)+1);
	var green = Math.floor((Math.random()*255)+1);
	var blue = Math.floor((Math.random()*255)+1);
	return "rgb(" + red + "," + green + "," + blue + ")";

	}






