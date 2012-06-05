class window.ProjectApplication.Audit extends Backbone.Model
    status: 
        queued_for_cloning:   1
        cloning:              2
        queued_for_parsing :  3
        parsing:              4
        queued_for_auditing:  5
        auditing :            6
        completed:            7
