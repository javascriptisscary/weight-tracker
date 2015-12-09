jQuery(function($){$(document).ready(function () {


   
   


 //Fade notices and alerts 
  
    $('.notice').fadeOut(10000);
    $('.alert').fadeOut(10000);
    

    

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

//datepicker for calender
    $( "#datepicker" ).datepicker({ format: 'yyyy-mm-dd'}).datepicker("setDate", new Date());

  });
       
       
       
       
       
       function getActualWidth()
{
    var actualWidth = window.innerWidth ||
                      document.documentElement.clientWidth ||
                      document.body.clientWidth ||
                      document.body.offsetWidth;
    console.log(actualWidth);
    return actualWidth;
}  

   
   
   function fixMobile(size) {
    var logo = document.getElementById("logo");
    var welcome_text = document.getElementsByClassName("welcome-text");
    var text_contain = document.getElementById("text-contain");
    var signup = document.getElementById("signup-welcome");
    
   
    
    if (size < 900) {
       logo.parentNode.removeChild(logo);
       text_contain.style.marginTop ="35%";
       welcome_text[0].style.fontSize = "3em";
       signup.style.fontSize = "1em";
    }
   }
   
   

   
   

    
    
    //grab window size, fix view for mobile by removing logo changing text sizes
 
       
       fixMobile(getActualWidth());
         
         
       
       
       
       
       
       
       });
       
       
       
    