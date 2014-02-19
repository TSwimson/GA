describe("Iterators", function() {
  describe(".each", function() {
    describe("given a null", function() {
      it("returns null", function() {
        expect(Iterators.each(null)).toBeNull();
      });
    });
    describe("given an array and an action as input", function() {
      var arr = [1,2,3,4], action = jasmine.createSpy('action');
      it("returns the array", function() {
        expect(Iterators.each(arr,action)).toBe(arr);
      });
      it("applies the action to each of the elements in array", function() {
        expect(action.calls.allArgs()).toEqual([[1],[2],[3],[4]]);
      });
    });
  });

  describe(".map", function() {
    describe("given a null", function() {
      it("returns null", function() {
        // first, get this example to pass
        expect(Iterators.map(null)).toBeNull();
      });
    });
    describe("given an array and an action as input", function() {
      var arr = [1,2,3,4], action = jasmine.createSpy('action');
      it("returns a new array", function() {
        expect(Iterators.map(arr, function(i){return i;})).not.toBe(arr);
      });
      it("returned array has results of the action applied to each element of the input array", function() {
        // For this one, imagine that you have an input array like
        // [1,2,3]. Think about how you'd expect the result of applying
        // a function like function (el) { return el * 2; } to be used
        // to construct the result array.

        // From that point, see if you could figure out how to abstract that out 
        // to the more general case, to check whether map applies *any* function
        // to each element to return the result array 
        var new_arr = [2,3,4,5];
        expect(Iterators.map(arr, function(i){return i+1;}).join()).toBe(new_arr.join());
      });
      it("does not modify the original array at all", function() {
        Iterators.map(arr, function(i){return i+2;});
        expect(arr.join()).toBe([1,2,3,4].join());
      });
    });
  });

  describe(".reduce", function() {
    var arr = [1,2,3,4];
    it("assigns value of function to accumulator and works like inject", function() {
      expect(Iterators.reduce(arr,0, function(a, i){
        return a  + i;
      })).toBe(10);
    });
  });
});