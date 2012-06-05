describe "ProjectApplication", ->
    
    beforeEach ->
        Backbone.history.stop() if Backbone.history
        
    it "passes a sanity test", ->
        project = new ProjectApplication.Project()
        app = new ProjectApplication(project)
        expect(app.sanity()).toEqual(true)