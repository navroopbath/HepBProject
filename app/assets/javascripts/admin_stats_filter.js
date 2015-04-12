var SearchBar = {
  setup: function() {
    $(document).on("click", "#filter_mems", MemberList.filterList);
  }
}
$(SearchBar.setup);

var MemberList = {
  filterList: function() {
    var search_value = $("#search_input").val();
    var rows = $("tr.member_row");
    rows.filter(function() {
      var name = $.trim($(this).find("th.full_name").text());
      console.log(name === search_value);
      return !(name === search_value);
    }).remove();
    /*var search_value = $("#search_input").val();
    var rows = $("tr.member_row");
    rows.btsListFilter(search_value, {itemChild: $(this).find("th.full_name")});*/
  }
}