$(document).ready( function(){
  console.log( "bitch" );
  var num_inputs = "input[type='number']";


    _( $(num_inputs) ).each( function( item ) {
      $( item ).val( 20 );
    } );

  $(num_inputs).change( function( ev ) {
    var sum = 0;

    _( $(num_inputs) ).each( function( item ) {
      console.log( item.value );
      sum += parseInt( item.value || 0 );
    } );

    console.log( sum );

    if ( sum > 100 ){
      alert( "all values must be sumemd up to 100");
      $(ev.currentTarget).val(0);
    }
  } );


} ) ;


