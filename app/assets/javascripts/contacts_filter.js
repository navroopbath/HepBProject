var MemberList = {
  filterList: function() {
    $('#searchlist').btsListFilter('#searchfield', {itemChild: 'span', itemEl: 'a.list-group-item'});
  }
}
$(MemberList.filterList)