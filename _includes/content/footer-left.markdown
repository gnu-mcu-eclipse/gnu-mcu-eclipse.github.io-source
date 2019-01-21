{% if site.copyright-message %}* {{ site.copyright-message }}{% endif %}
* [![RSS]({{ site.baseurl }}/assets/images/feed-20.png)]({{ site.baseurl }}/feed.xml)
{% if site.twitter-url %}* <a href="{{site.twitter-url}}" class="twitter-follow-button" data-show-count="false">Follow @{{site.twitter-id}}</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>{% endif %}
{% if site.facebook-page %}* <div class="fb-like" data-href="{{ site.facebook-page }}" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>{% endif %}
