class window.ProjectApplication
    sanity: -> true
    
    constructor: ->
        new ProjectApplication.Router()
        Backbone.history.start()
    
#PrivatePub.subscribe "/projects/1", (data, channel) ->
#    console.log data
#    console.log channel