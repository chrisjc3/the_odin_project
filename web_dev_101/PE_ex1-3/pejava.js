/*'delete' additional elements*/
/*apparently easy in jQuery, not worth writing in js*/
function delcalc(){
	window.location.reload();
}

/****************************PROJECT EULER PROBLEM 1*******************************/
function MultiplesUnder(bynumber, under){
	var mList = new Array();
	var g=parseInt(1);
	var bynumber=parseInt(bynumber);
	var under=parseInt(under);
	for (i=bynumber; i < under;){
		g++;
		mList.push(i);
		i=bynumber*g;
	}
	var newElement = document.createElement('div');
	newElement.id = "hld_"+bynumber;
	newElement.className = "dip";
	newElement.innerHTML = mList;
	document.body.appendChild(newElement);
}
/*stack overflow sort 2nd response:http://stackoverflow.com/questions/9229645/remove-duplicates-from-javascript-array*/
function uniq(a) {
	return a.sort().filter(function(item, pos, ary) {
		return !pos || item != ary[pos - 1];
	})
}
function SumDivs(){
	var totalvar = new Array();
	var i = 1;
	var sum = 0;
	/*Loops through 10 instance of hld_*/
	/*hldray captures text of div container named hld_x*/
	/*tokens splits out hldray into something I can push into an array sequentially*/
	for(;i<=10;i++){
		var hld = document.getElementById('hld_'+i);
			if(hld !== null){
			var hldray = hld.innerHTML;
			var tokens = hldray.split(",");
				for(p=0;p<tokens.length;p++){
					totalvar.push(parseInt(tokens[p]))
				}
			}
	}
	/*sort and then remove if precendence*/
	var totalvar = uniq(totalvar);
	/*sum array*/
	for(j=totalvar.length; j--;){
		sum += parseInt(totalvar[j]);
	}
	/*post new sum to div container*/
		var newElement = document.createElement('p');
		newElement.id = "sum";
		newElement.className = "dip";
		newElement.innerHTML = "Sum of Arrays: " + sum;
		document.body.appendChild(newElement);
}

/****************************PROJECT EULER PROBLEM 2*******************************/

function Fibro4m(){
/*Generates Fibronacci Sequence till 4 million*/
	var Fibro = new Array();
	Fibro.push(1,2);
	/*Not technically the correct array for euler but 5702887 is odd*/
	for(var i=1;Fibro[i]<4000000;){
		var x = parseInt(Fibro[i])
		var y = parseInt(Fibro[i-1])
		Fibro.push(parseInt(x+y));
		i++;
	}
		var newElement = document.createElement('div');
		newElement.id = "fibseq";
		newElement.className = "dip";
	/*Test txt*/
	newElement.innerHTML = Fibro;
		document.body.appendChild(newElement);
}
function EvenFibro(){
	var totalvar = new Array();
	/*grab the fib div and parse it for even numbers*/
		var hld = document.getElementById('fibseq');
			var hldray = hld.innerHTML;
			var tokens = hldray.split(",");
				for(p=0;p<tokens.length;p++){
					if(tokens[p]%2 == 0){
						totalvar.push(parseInt(tokens[p]))
					}
				}
		var newElement = document.createElement('div');
		newElement.id = "fibseq-ev";
		newElement.className = "dip";
	/*Test txt*/
	newElement.innerHTML = totalvar;
		document.body.appendChild(newElement);
}

function SumFib(){
	var totalvar = new Array();
	var i = 1;
	var sum = 0;
	/*grab the fib div and parse it for even numbers*/
		var hld = document.getElementById('fibseq-ev');
			var hldray = hld.innerHTML;
			var tokens = hldray.split(",");
				for(p=0;p<tokens.length;p++){
					totalvar.push(parseInt(tokens[p]))
				}
	/*sum array*/
	for(j=totalvar.length; j--;){
		sum += parseInt(totalvar[j]);
	}
		var newElement = document.createElement('div');
		newElement.id = "fibseq-ev-sum";
		newElement.className = "dip";
	/*Test txt*/
	newElement.innerHTML = "Sum of Fibro Even #'s under 4 million: " + sum;
		document.body.appendChild(newElement);


}

/****************************PROJECT EULER PROBLEM 3*******************************/
function LargestPrime(x){
/*FIND JUST PRIME NUMBER, MISINTERPRETTED PROBLEM*/
	/*var Primes = new Array;
	for(var i=2;i<x;i++){
		var t = 0;
		for(var j=2;j<(i-1);j++){
			if(i%j==0){
				var t = 1;
			}
		}
		if(t == 0){
			Primes.push(i)
		}
	}*/
/*FIND PRIME FACTORS*/
	var Primes = new Array;
	var y = x
	for(var i=2;i<x;){
		if(y%i==0){
			Primes.push(i)
			var y = y/i
		} else {
			i++
		}
	
	}
		var newElement = document.createElement('div');
		newElement.id = "primes";
		newElement.className = "dip";
		newElement.innerHTML = Primes;
		document.body.appendChild(newElement);
}

