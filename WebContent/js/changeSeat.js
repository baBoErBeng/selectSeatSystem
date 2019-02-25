function chooseStatus() {
	var status = document.getElementById("seat_status");
	var condiction = document.getElementById("seat_condiction");
	var index = status.options.selectedIndex;
	var stuIdDiv = document.getElementById("stuIdDiv");
	if(index == 3){ //seat_status = 'stop'时
		condiction.style.display = "block";
		condiction.options.add(new Option("unknown", undefined));
		condiction.options.add(new Option("bad", undefined));
		stuIdDiv.style.display = "none";
	}else{
		if(index == 0){//seat_status = 'booked'时
			stuIdDiv.style.display = "none";
		}else{
			stuIdDiv.style.display =  "block";
		}
		condiction.style.display = "block";
		condiction.options.add(new Option("good", undefined));
	}
}	
