$(function() {
  $(".pagination a").live('click',function() {
    $(".pagination").html('posts are loading');
    $.getScript(this.href);
    return false;
   });
});
