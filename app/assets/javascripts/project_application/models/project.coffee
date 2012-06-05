class window.ProjectApplication.Project extends Backbone.Model
    
    constructor: (data) ->
        super(data)
        @gems = new ProjectApplication.GemsCollection()
        @audit = null

        PrivatePub.subscribe "/projects/#{@id}", (data, channel) =>
            @audit.set(data.audit) if data.audit