

$('#ratingCurso')
   .rating({
    initialRating: 1,
    maxRating: 1,
    interactive:false
  })
;

$('#ratingModal')
   .rating({
    initialRating: 0,
    maxRating: 5
  })
;

$('#ratingCalificate')
.rating({
 maxRating: 5,
 interactive:true
});

$('#ratingModalOpen').on('shown.bs.modal', function () {
    var rating = $('#ratingModal').rating('get rating');
    $('#ratingCalificate').rating('set rating',rating);
  })