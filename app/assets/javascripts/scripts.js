$(function() {

  // .one: unbind event handler after one hit - need this until we figure out how to simply reload existing onload methods

  // feed level - subscribe and unsubscribe
  $('#subscribe.subscribe').one('click', subscribeToFeed);
  $('#subscribe.unsubscribe').one('click', unsubscribeFromFeed);

  // article level - archive and unarchive
  $('#archive.archive').one('click', archiveArticle);
  $('#archive.unarchive').one('click', unarchiveArticle);

  // article level - bookmark and unbookmark
  $('#bookmark.bookmark').one('click', bookmarkArticle);
  $('#bookmark.unbookmark').one('click', unbookmarkArticle);

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

        var $subscribeCount = $('#subscribe-count').val();
        $subscribeCount++;
        if($subscribeCount == 1) {
          $('#subscribe-count').html($subscribeCount + " subscriber")
        } else {
          $('#subscribe-count').html($subscribeCount + " subscribers")
        }
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

        var $subscribeCount = $('#subscribe-count').val();
        $subscribeCount - 1;
        if($subscribeCount == 1) {
          $('#subscribe-count').html($subscribeCount + " subscriber")
        } else {
          $('#subscribe-count').html($subscribeCount + " subscribers")
        }
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function archiveArticle() {
    console.log("archiving");
    var $this = $(this);
    var articleId = $this.data('article-id');
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/articles/' + articleId + '/bookmark';

    $.ajax({
      url: url,
      type: 'POST',
      success: function() {
        var $archive = $('#archive');
        $archive.html('Unarchive');
        $archive.removeClass('archive');
        $archive.addClass('unarchive');
        $('#archive.unarchive').one('click', unarchiveArticle);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function unarchiveArticle() {
    console.log("unarchiving");
    var $this = $(this);
    var articleId = $this.data('article-id');
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/articles/' + articleId + '/unarchive';

    $.ajax({
      url: url,
      type: 'PUT',
      success: function() {
        var $archive = $('#archive');
        $archive.html('Archive');
        $archive.removeClass('unarchive');
        $archive.addClass('archive');
        $('#archive.archive').one('click', archiveArticle);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function bookmarkArticle() {
    console.log("bookmarking");
    var $this = $(this);
    var articleId = $this.data('article-id');
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/articles/' + articleId + '/bookmark';

    $.ajax({
      url: url,
      type: 'POST',
      success: function() {
        var $bookmark = $('#bookmark');
        $bookmark.html('Remove Bookmark');
        $bookmark.removeClass('bookmark');
        $bookmark.addClass('unbookmark');
        $('#bookmark.unbookmark').one('click', unbookmarkArticle);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function unbookmarkArticle() {
    console.log("unbookmarking");
    var $this = $(this);
    var articleId = $this.data('article-id');
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/articles/' + articleId + '/unbookmark';

    $.ajax({
      url: url,
      type: 'PUT',
      success: function() {
        var $bookmark = $('#bookmark');
        $bookmark.html('Bookmark');
        $bookmark.removeClass('unbookmark');
        $bookmark.addClass('bookmark');
        $('#bookmark.bookmark').one('click', bookmarkArticle);
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

});
