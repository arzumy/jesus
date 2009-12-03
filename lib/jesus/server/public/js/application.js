$(document).ready(function() {
  var timeOut = 30000;
  
  /*
  * Regularly, we start a new processes lookup
  * Only if we're on a page that needs it (with a "automatic update" div)
  */
  if (document.getElementById('automatic_update') != null) {
    setTimeout(function() {
      update_processes();
    }, timeOut);
  }
})

/*
* We look the processes statu
* And we update the status if it's been changed
*/
function update_processes() {
  // We get the json data
  $.getJSON('/json', function(data){
    // We loop through the groups
    $.each(data, function(i, group) {
      // And through the processes
      $.each(group, function(j, item) {
        // And we update the process's class with the state
        $('#' + i + '-' + j).attr('class', item.state);
      });
    });
    
    // And we update the last automatic update date
    var d = new Date();
    $('#automatic_update').html('Statuses update at ' + d.getHours() + ':' + zeroPad(d.getMinutes(), 1));
  });
  
  /*
  * We want to update the processes regularly. So we add a new timer
  * For now, we can add this timer in this function as we don't use it anywhere else than in the automatic update
  * TODO: remove it from here to allow the add of a manual "update processes" link.
  */
  setTimeout(function() {
    update_processes();
  }, timeOut);
}


/*
 * Appends a zero to the appropriate number of zeros to a number so we always have the same number of digits when transforming to a string
 * There's probably a better solution to doing this. I'm highly open to suggestions.
*/
function zeroPad(num, count) {
  var numZeropad = num + '';
  while(numZeropad.length < count) {
    numZeropad = "0" + numZeropad;
  }
  return numZeropad;
}