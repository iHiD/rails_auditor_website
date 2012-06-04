class ProjectApplication.Router extends Backbone.Router
        
    routes:
        "": "index"
        
    constructor: ->
        super()
        @project = new ProjectApplication.Project()
        
    index: ->
        view = new ProjectApplication.ProjectView(@project)
        $('#project').replaceWith(view.render().el)