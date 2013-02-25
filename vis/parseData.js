//Data Parsing Functions

//take in data array and output in the right x y format for rickshaw
//this method applies the time constant for the given data. 

var timeConstant = 1/120;

//original_date is the date in milliseconds since july 1970 that the data sample was taken (epoch time)

function convertArrayCoordsWithTime(a){
	
	var dataArray = [];
	var newX=0;
	var newY=0;
	var dateX = 0;
	var newPoint=0;
	var nume = 0;
	var denom = 2; //current time constant - half a second
	for(i=0;i<a.length;i++)
	{
		nume = i;
		newX= nume/denom;
		//convert newX to milliseconds
		dateX = newX//*1000 //+ original_date
		newPoint = { x:dateX, y:a[i] };
		dataArray.push(newPoint);
	}
	
	return dataArray;
}