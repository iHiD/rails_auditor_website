class ProjectApplication.GemsCollection extends Backbone.Collection
    
    model: ProjectApplication.Gem
    
    constructor: (@project) ->
        super()