$(document).ready(function(){
	/*Could add user input for 17 (+1 of total grid ie 17=16x16*/
	var gengrid = function(gridno,scl){
	/*Should probably have a modulo check here*/
	$("[id^=subdiv]").remove();
		for(var j = 1; j <= gridno; j++){
			for(var i = 1; i <= gridno; i++){
				var $pop = $("<div id='subdiv" + i + "' class='subcont" + j + "'></div>") 
				var $mcont = $("#mastercont")
				$mcont.append($pop)
			}
		}
		/*Format by "melted" div containers*/
		/*16 = 6.68%*/
		/*-1.43% for 4//0.3575 per diff*/
		/*20 = 5.25%*/
		/*-2.7% for 20//0.135 per diff*/
		/*40 = 2.55%*/
		/*-0.97% for 24//0.040416 per diff*/
		/*64 = 1.58%*/
		/*-0.57% for 36//0.01583 per diff*/
		/*100 = 1.01%*/
		/*The hell is the correlation*/
		/*Succumb to button use...*/

		var rowht = scl;
		var colwd = scl;
		
		/*Control initial SIZE and styles*/
		$("[id^=subdiv]").css("height",rowht + "%");
		$("[id^=subdiv]").css("width",colwd + "%");
		$("[id^=subdiv]").css("display","block");
		$("[id^=subdiv]").css("border","2px solid black");
		$("[id^=subdiv]").css("position","absolute");

		/*Control block row/column positions*/
		var rowht = 0;
		var colwd = 0;
		for(var i = 1; i < gridno; i++){
			$("[id=subdiv" + i + "]").css("top", rowht + "%");
		rowht = rowht + scl;
		}
		for(var i = 1; i < gridno; i++){
			$("[class=subcont" + i + "]").css("left", colwd + "%");
		colwd = colwd + scl;
		}
		
		/*Control hover effect*/
		$("[id^=subdiv]").mouseenter(function(){
			$(this).addClass("highlight");
		});
		
	}
	
	/*Calls for button click event to take user input #*/
    $('input[name=Gen16]').click(function() {
		var gridno = 16;
		var scl = 6.68;
		gengrid(gridno,scl);
    });
   $('input[name=Gen20]').click(function() {
		var gridno = 20;
		var scl = 5.25;
		gengrid(gridno,scl);
    });
   $('input[name=Gen40]').click(function() {
		var gridno = 40;
		var scl = 2.55;
		gengrid(gridno,scl);
    });
   $('input[name=Gen64]').click(function() {
		var gridno = 64;
		var scl = 1.58;
		gengrid(gridno,scl);
    });
   $('input[name=Gen100]').click(function() {
		var gridno = 100;
		var scl = 1.01;
		gengrid(gridno,scl);
    });
	
});

function delcalc(){
	$("[id^=subdiv]").remove();
	$('input[name=gsize]').val("");
}






















