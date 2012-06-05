class ProjectApplication.Router extends Backbone.Router
        
    routes:
        "": "index"
        "overview": "overview"
        "configuration": "configuration"
        "visualisation": "visualisation"
        "issues": "issues"
        
    constructor: (@project) ->
        super()
        @projectView = new ProjectApplication.ProjectView(@project)
        $('#project').replaceWith(@projectView.render().el)
        
    index: ->
        @overview()
        
    overview: ->
        @projectView.showSection('overview')
        
    configuration: ->
        @projectView.showSection('configuration')
        
    visualisation: ->
        @projectView.showSection('visualisation')
        
    issues: ->
        @projectView.showSection('issues')