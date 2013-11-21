$(function() {

  // .one: unbind event handler after one hit - need this until we figure out how to simply reload existing onload methods

  // feed level - subscribe and unsubscribe
  $('#subscribe.subscribe').one('click', subscribeToFeed);
  $('#subscribe.unsubscribe').one('click', unsubscribeFromFeed);

  // feed level - option to mark a subscribed feed as private
  $('#subscribe-visibility.hide-on-profile').one('click', setSubscribedFeedAsPrivate);
  $('#subscribe-visibility.show-on-profile').one('click', setSubscribedFeedAsPublic);

  // article level - archive and unarchive
  $('#archive.archive').one('click', archiveArticle);
  $('#archive.unarchive').one('click', unarchiveArticle);

  // article level - bookmark and unbookmark
  $('#bookmark.bookmark').one('click', bookmarkArticle);
  $('#bookmark.unbookmark').one('click', unbookmarkArticle);

  function subscribeToFeed() {
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/subscribe';

    $.ajax({
      url: url,
      type: 'POST',
      success: function() {
        var $subscribe = $('#subscribe');
        var $visibility = $('#subscribe-visibility');
        $subscribe.html('Unsubscribe');
        $subscribe.removeClass('subscribe');
        $subscribe.addClass('unsubscribe');
        $('#subscribe.unsubscribe').one('click', unsubscribeFromFeed);
        $visibility.removeClass('hidden'); // provide option for user to hide this feed on profile right after subscribing for the first time
        $visibility.addClass('hide-on-profile');
        $('#subscribe-visibility.hide-on-profile').one('click', setSubscribedFeedAsPrivate);

        if(window.location.pathname == "/feeds/"+feedId) {
          var $subscribeCount = $('#subscribe-count').val();
          updateSubscribeCountOnFeedShowPage($subscribeCount, "subscribe");
        }

      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function unsubscribeFromFeed() {
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
        $('#subscribe-visibility').addClass('hidden'); // no need for either 'hide on profile' or 'show on profile' if unsubscribed

        if(window.location.pathname == "/feeds/"+feedId) {
          var $subscribeCount = $('#subscribe-count').val();
          updateSubscribeCountOnFeedShowPage($subscribeCount, "unsubscribe");
        }
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function updateSubscribeCountOnFeedShowPage(currentCount, subscriptionStatus) {
    // calculate
    if(subscriptionStatus == "subscribe") {
      currentCount++;
    } else {
      currentCount - 1;
    }

    // display
    if(currentCount == 1) {
      $('#subscribe-count').html(currentCount + " subscriber");
    } else {
      $('#subscribe-count').html(currentCount + " subscribers");
    }
  }

  function setSubscribedFeedAsPrivate() {
    console.log("about to set feed as private");
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/hide_on_profile';

    $.ajax({
      url: url,
      type: 'PUT',
      success: function() {
        var $subscribeVisibility = $('#subscribe-visibility');
        $subscribeVisibility.html('Show on Profile');
        $subscribeVisibility.removeClass('hide-on-profile');
        $subscribeVisibility.addClass('show-on-profile');
        $('#subscribe-visibility.show-on-profile').one('click', setSubscribedFeedAsPublic);
        console.log("Set to private!");
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  function setSubscribedFeedAsPublic() {
    console.log("about to set feed as public");
    var $this = $(this);
    var feedId = $this.data('feed-id');
    var url = '/feeds/' + feedId + '/show_on_profile';

    $.ajax({
      url: url,
      type: 'PUT',
      success: function() {
        var $subscribeVisibility = $('#subscribe-visibility');
        $subscribeVisibility.html('Hide on Profile');
        $subscribeVisibility.removeClass('show-on-profile');
        $subscribeVisibility.addClass('hide-on-profile');
        $('#subscribe-visibility.hide-on-profile').one('click', setSubscribedFeedAsPrivate);
        console.log("Set to public!")
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
    var url = '/feeds/' + feedId + '/articles/' + articleId + '/archive';

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
        $bookmark.html('Unbookmark');
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

        if(window.location.pathname == "/articles/my_bookmarks") {
          location.reload();
        }
      },
      error: function() {
        console.log('ERROR');
      }
    });
  }

  $("img").error(function () {
    $(this).css({visibility:"hidden"});
  });

});
