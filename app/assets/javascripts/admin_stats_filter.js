var MemberList = {
  filterList: function() {
    $('#searchlist').btsListFilter('#searchinput', {itemChild: 'th.full_name', itemEl: 'tr.member_row'});
  }
}
$(MemberList.filterList)