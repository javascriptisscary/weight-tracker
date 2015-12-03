$(document).on('page:change', function(){

debugger;

//change table row color to green if user lost weight, red if gained, blue if the same.
  function red_or_green() {
    var weights = document.getElementsByClassName("weight")
    var context = document.getElementsByClassName("context")


//jump out if no tables present
if (context[0] ==null) {
  return;
}



//first number is always blue (info class)
    context[0].className += " info";

    var x;
    var y = 1;
    
    for (x =0; x< (context.length -1); x++) {
             
      if ( (parseFloat(weights[x].innerHTML) - parseFloat(weights[y].innerHTML) > 0) ) {
        context[y].className += " success";
  }
      else if  ( (parseFloat(weights[x].innerHTML) - parseFloat(weights[y].innerHTML) < 0) ) {
        context[y].className += " danger";
 }
      else {
        context[y].className += " info";
  }
  
      y++
}
}



red_or_green();

});