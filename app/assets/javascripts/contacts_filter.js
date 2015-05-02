var ContactList = {
  filterList: function() {
    $('#searchlist').btsListFilterContacts('#searchfield', {itemChild: 'span', itemEl: 'a.list-group-item'});
  }
}
$(ContactList.filterList)