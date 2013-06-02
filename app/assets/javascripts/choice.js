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
  $('#sum').text( "Total: " + sum );
}



$(document).ready( function(){

  var self = this;
  console.log( "bitch" );

  var num_inputs = "input[type='number']";
  var first_list = "num_inputs";


  for (var i=0; i < 5; i++) {
    //debugger;
    var bla = $('.draw .choiceparams ul li')[i];
    var bla2 = $(bla).val();
    //debugger;
    console.log(bla2);


    var nir = $($('.draw .choiceparams ul li label')[i]).html().split(" " ) [2];


    var set_it = $("input[type='number']")[i];
    $(set_it).val( nir);

    //$( item ).val( 5 );
  };


  //_( $($('.draw .choiceparams ul li')) ).each( function( item ) {
    //$( item ).val( 5 );
  //} );


  window.change_sum();

  $(num_inputs).change( function( ev ) {
    window.change_sum();

    if ( sum > 100 ){
      alert( "all values must be sumemd up to 100");
      $(ev.currentTarget).val(0);
    }
  } );



  $('.filterInteresting').change( function ( ev ) {


    if( ev.currentTarget.checked === true){


      _( $('.interesting')).each( function( item ){
        if ( item.checked === false ){
            $(item).parent().parent().hide( 500 );
        }
      });


    }
    else{

      $('.draw').show( 500 );

    }
  });




} ) ;


