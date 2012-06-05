class window.ProjectApplication.ProjectView extends Backbone.View
    
    id: "project"
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/project']( project: @project.toJSON() )
        $(@el).html(template)
        
        @projectBarView = new ProjectApplication.ProjectBarView(@project)
        @$('#project_bar').replaceWith(@projectBarView.render().el)
        
        @overviewView = new ProjectApplication.OverviewView(@project)
        @$('#overview').replaceWith(@overviewView.render().el)
        
        @configurationView = new ProjectApplication.ConfigurationView(@project)
        @$('#configuration').replaceWith(@configurationView.render().el)
        
        @showSection('overview')
        
        this
        
    showSection: (name) ->
        @$(".section").hide()
        @$("##{name}.section").show()
        
        @projectBarView.selectTab(name)