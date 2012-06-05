class window.ProjectApplication
    sanity: -> true
    
    constructor: (@project) ->
        @router = new ProjectApplication.Router(@project)
        Backbone.history.start()
    
#PrivatePub.subscribe "/projects/1", (data, channel) ->
#    console.log data
#    console.log channel