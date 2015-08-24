function fixCellWidth(){
  var $el;
  return this.each(function() {
    $el = $(this);
    var newDiv = $("<div />", {
        "class": "innerWrapper",
        "css"  : {
        "height"  : $el.height(),
        "width"   : "100%",
        "position": "relative"
    }
   });
   $el.wrapInner(newDiv);    
  });
}

$(document).on('ready page:load',function(){

  console.log('ready!');

  $('.dispute-icon').find('tr').click(function(){
    var row = $(this).find('td:first').text();
    console.log('icon clicked ' + row);
    fixCellWidth();
    alert("fixCellWidth");
  });

  $('.card').find('tr').click(function(){
    var row = $(this).find('td:first').text();
    console.log('You clicked ' + row);
  });

  $('.account').find('tr').click(function(){
    var row = $(this).find('td:first').text();
    console.log('You clicked ' + row);
  });

  $('.transaction').find('tr').click(function(){
    var row = $(this).find('td:first').text();
    console.log('You clicked ' + row);
  });

  $('.dispute-icon').on('ajax:complete', function(e) {
    //$('body').css('background-color', 'red');
  });

  $('.offers').on('click', function(e) {
    alert("Feature not implemented yet.");
  });

  $('.payments').on('click', function(e) {
    alert("Feature not implemented yet.");
  });
});

