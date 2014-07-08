$(document).ready (function(){
  resetBoard();

  $('.move').click(function(e) {
    e.preventDefault();
    var fen = $(this).attr('href');
    var id = $(this).attr('id');
    setCurrentMove(id);
    populateBoard(fen);
  })

  $('a').click(function() {
    var currentMove = getCurrentMove();
    var totalMoves = getTotalMoves();

    if (currentMove === '0') {
      disableButton('input[value=Previous]');
      removeAttribute('input[value=Next]', 'disabled')
    } else if (currentMove === totalMoves) {
      disableButton('input[value=Next]');
      removeAttribute('input[value=Previous]', 'disabled')
    } else {
      removeAttribute('input[value=Next]', 'disabled');
      removeAttribute('input[value=Previous]', 'disabled');
    }
  });

  $('input[value="Go!"]').click(function(e) {
    e.preventDefault();
    var id = $('#move_count').val();

    if (checkIfHrefPresent(id) === true) {
      setCurrentMove(id);
      triggerClick(id);
      emptyTextBox('move_count');
      $('#move_count').focus();
    } else {
      alert('No such move!');
      emptyTextBox('move_count');
    }
  })

  $('input[value=Next]').click(function(e) {
    e.preventDefault();
    nextMove();
  })

  $('input[value=Previous]').click(function(e) {
    e.preventDefault();
    previousMove();
  })
})

var emptyBoard = function() {
  $("td").each(function(){
    $(this).removeClass();
  })
}

var resetBoard = function() {
  var start_board = $('#0').attr('href');
  $('input[value=Previous]').attr('disabled','disabled');
  populateBoard(start_board);
}

var populateBoard = function(fen) {
  emptyBoard();
  var counter = 0

  $("td").each(function() {
    if ( fen[counter] == '0') {
      null
    } else {
      $(this).addClass(fen[counter])
    }
    counter++
  });
} 

var emptyTextBox = function(textBoxId) {
  $('#' + textBoxId).val('');
}

var nextMove = function() {
  var currentMove = parseInt(getCurrentMove());
  var nextMove = (currentMove + 1).toString();
  setCurrentMove(nextMove);
  triggerClick(nextMove);
}

var previousMove = function() {
  var currentMove = parseInt(getCurrentMove());
  var previousMove = (currentMove - 1).toString();
  setCurrentMove(previousMove);
  triggerClick(previousMove);
}

// Refactoring
var getCurrentMove = function() {
  return $('input[name=current_move]').val();
}

var getTotalMoves = function() {
  return $('input[name=total_moves]').val();
}

var setCurrentMove = function(value) {
  $('input[name=current_move]').val(value);
}

var triggerClick = function(elementId) {
  $('#' + elementId).trigger('click');
}

var removeAttribute = function(element, attribute) {
  $(element).removeAttr(attribute);
}

var disableButton = function(button) {
  $(button).attr('disabled', 'disabled');
}

var checkIfHrefPresent = function(id) {
  var href = $('#' + id).attr('href');

  if (href === undefined) {
    return false;
  } else {
    return true;
  }
}
