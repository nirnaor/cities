$( document ).ready( function(){
  console.log('nirnaor');

  $( "input[ type = 'number' ]").change(function( ev, data){
    console.log('number changed');
  });
});
