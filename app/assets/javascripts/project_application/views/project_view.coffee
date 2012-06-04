class window.ProjectApplication.ProjectView extends Backbone.View
    
    id: "project"
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/project_view']( @project.toJSON() )
        $(@el).html(template);
        this