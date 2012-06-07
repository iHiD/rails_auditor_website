class window.ProjectApplication.Audit extends Backbone.Model
    
    constructor: (data) ->
        super(data)
        @gems = new ProjectApplication.GemsCollection()
        @gems.url = "/audits/#{@id}/gems"
        @gems.fetch()

window.ProjectApplication.Audit.Status = 
    queued_for_cloning:   1
    cloning:              2
    queued_for_parsing :  3
    parsing:              4
    queued_for_auditing:  5
    auditing :            6
    completed:            7

