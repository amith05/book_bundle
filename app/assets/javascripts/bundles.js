jQuery(document).ready(function(){
  jQuery('.submit-search').on('click',function(event){
    event.preventDefault();
    jQuery('.display_search_results').html('<center><img src="assets/round-loading-icon_red.gif" style="width: 66px;margin: 99px 0px 0px -43px;border-radius: 37px;" alt="loading ... "/></center>')
    jQuery('#book_search_form').submit();
  });

  jQuery('.add_to_bundle').on('click',function(event){
    event.preventDefault();
    var title_id = jQuery(this).attr('title_id');
    jQuery.get('/bundles/add_title?'+'title_id='+title_id,
      function(data){
    });
  });

  jQuery('.remove_from_bundle').on('click',function(event){
    event.preventDefault();
    var title_id = jQuery(this).attr('title_id');
    jQuery('#bundle_title_'+title_id).hide();
    jQuery.get('/bundles/remove_book?'+'title_id='+title_id,
      function(data){
    });
  });

});















