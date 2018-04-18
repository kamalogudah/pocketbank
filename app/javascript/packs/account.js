import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
var accounts = new Vue({
  el: '#accounts',
  data: {
    accounts: []
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/accounts.json',
      success: function(res) {
        that.accounts = res;
      }
    });
  }
})
});