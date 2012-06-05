class window.ProjectApplication.Project extends Backbone.Model
    
    constructor: (data) ->
        super(data)
        @gems = new ProjectApplication.GemsCollection()