var Iterators = (function() {
  return {
    each: function (arr, action) {
      if (arr === null) return arr;
      for (var i=0; i < arr.length; i++) {
        action(arr[i]);
      }
      return arr;
    },
    map: function(arr, action) {
      if (arr === null) {
        return null;
      }
      var new_arr = [];
      Iterators.each(arr, function(i){
        new_arr.push(action(i));
      });
      return new_arr;
    },
    reduce: function(arr, base, action) {
      Iterators.each(arr,
       function(i) {
          base = action(base, i);
       });
      return base;
    }
  };
})();