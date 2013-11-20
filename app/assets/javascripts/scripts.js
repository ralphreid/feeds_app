$(function() {

  $('.subscribe').click(function() {
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/subscribe';
    console.log(url);

    $.ajax({
      url: url,
      type: 'POST',
      success: function() {
        $this.html('Unsubscribe')
      },
      error: function() {
        console.log('ERROR');
      }
    });
  });

});
