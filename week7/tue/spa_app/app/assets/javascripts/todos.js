$(function() {

  var App = {};
  window.App = App;

  App.models = [];
  // [
  //   {id: 1, title: "Walk the dog", completed: false},
  //   {id: 2, title: "Take out the trash", completed: false},
  //   {id: 3, title: "Clean car", completed: false},
  //   {id: 4, title: "Eat", completed: true}
  // ];
  App.urls = {
    index : { path: '/todos.json', method: 'get' },
    create : { path: '/todos/create.json', method: 'post'}
  };
  App.count = 4;

  App.findModel = function(id){
    var foundModel;
    $(this.models).each(function(index, item){
      if (item.id === id) {
        foundModel = item;
      }
    });
    return foundModel;
  };

  App.doThis = function(func) {
    func.apply(App);
    return this;
  };

  App.setTarget = function(sel) {
    this.target = sel;
    this.$target = $(sel);
    return this;
  };

  App.setTemplate = function(name) {
    this.template = HandlebarsTemplates[name];
    return this;
  };

  App.setTargetTemplate = function(sel, name) {
      this.setTarget(sel).setTemplate(name);
      return this;
  };

  App.render = function(item) {
    this.$el = $(this.template(item));
    this.$target.append(this.$el);
    return this;
  };

  App.renderAllModels = function() {
    var _this = this;
    $(this.models).each(function(index, todoModel){
      _this.render(todoModel);
    });
    return this;
  };

  App.saveModel = function(model, callback) {
    this.count += 1;
    model.id = this.count;
    callback(model);
  };

  App.updateItem = function(model, callback) {
    callback(model);
  };

  App.getItems = function(callback) {
    $.ajax({
      url: this.urls.index.path,
      type: this.urls.index.method
    }).done(callback);
    return this;
  };

  App.doThis(function(){
      var _this = this;
      // Add new models from a form
      $("#add_todo").on("submit",function(event){
        event.preventDefault();
        var newTodo = {completed: false};
        newTodo.title = $("#todo_title").val();
        _this.saveModel(newTodo, function(data){
            _this.models.push(data);
            _this.render(data);
        });
      });
    });

  App.doThis(function(){
      var _this = this;
      
      //CHECKBOX EVENTHANDLER
      $("#todos").on("click", ".todo", function(event){
        console.log(this.dataset);
        var id = Number(this.dataset.id);
        if(event.target.name === "completed"){
          var view = this;
          var todo = _this.findModel(id);
          todo.completed = !todo.completed;
          _this.updateItem(todo, function(){
            $(view).toggleClass('done-true');
          });
        }
      });
  });

  App.doThis(function() {
    var _this = this;
    _this.getItems(function(responseData) {
      _this.models = _this.models.concat(responseData);
      _this.setTargetTemplate("#todos", "todo").renderAllModels();
    });
    return _this;
  });
});
