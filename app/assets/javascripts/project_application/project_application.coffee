class window.ProjectApplication
    sanity: -> true
    
    constructor: (@project) ->
        @router = new ProjectApplication.Router(@project)
        Backbone.history.start()