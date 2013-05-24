function get_sum(){
    var num_inputs = "input[type='number']";
    var sum = 0;


    _( $(num_inputs) ).each( function( item ) {
      console.log( item.value );
      sum += parseInt( item.value || 0 );
    } );

    return sum;
}

function change_sum(){
  var sum = window.get_sum();
  $('#sum').text( "Sum is " + sum  + "out of 100");
}



$(document).ready( function(){

  var self = this;
  console.log( "bitch" );

  var num_inputs = "input[type='number']";

  _( $(num_inputs) ).each( function( item ) {
    $( item ).val( _.random(0, 20 ) );
  } );


  window.change_sum();

  $(num_inputs).change( function( ev ) {
    window.change_sum();

    if ( sum > 100 ){
      alert( "all values must be sumemd up to 100");
      $(ev.currentTarget).val(0);
    }
  } );




} ) ;


