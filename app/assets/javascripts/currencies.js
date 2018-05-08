$( document ).ready(function() {

var chart;
    $.get( "/currencies/get_amounts", function( data ) {
     console.log(data.key);
     chart = c3.generate({
        data: {
        columns: data.key,
        type : 'donut',
        
        },
        donut: {
            title: "Iris Petal Width"
        }
    });
 });
    

  

  
     setInterval(function () {
        $.get( "/currencies/get_amounts", function( data ) {
            chart.load({
                columns: data.key
            });
        });
    },2000);  
  

  
});


