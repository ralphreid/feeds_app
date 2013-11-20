$(function() {

  // .one: unbind event handler after one hit
  $('#subscribe.subscribe').one('click', subscribeToFeed);
  $('#subscribe.unsubscribe').one('click', unsubscribeFromFeed);

  function subscribeToFeed() {
    console.log('subs');
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/subscribe';

    $.ajax({
      url: url,
      type: 'POST',
      success: function() {
        var $subscribe = $('#subscribe');
        $subscribe.html('Unsubscribe');
        $subscribe.removeClass('subscribe');
        $subscribe.addClass('unsubscribe');
        $('#subscribe.unsubscribe').one('click', unsubscribeFromFeed);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function unsubscribeFromFeed() {
    console.log('unsubs');
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/unsubscribe';

    $.ajax({
      url: url,
      type: 'PUT',
      success: function() {
        var $subscribe = $('#subscribe');
        $subscribe.html('Subscribe');
        $subscribe.removeClass('unsubscribe');
        $subscribe.addClass('subscribe');
        $('#subscribe.subscribe').one('click', subscribeToFeed);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

});
