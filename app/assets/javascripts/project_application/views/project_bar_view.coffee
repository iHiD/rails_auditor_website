class window.ProjectApplication.ProjectBarView extends Backbone.View
    
    id: "project_bar"
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/project_bar']( project: @project.toJSON())
        $(@el).html(template)
        this
        
    selectTab: (name) ->
        @$('.tab').removeClass('selected')
        @$(".#{name}.tab").addClass('selected')