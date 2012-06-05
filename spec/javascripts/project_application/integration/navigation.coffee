describe "Navigation", ->
    
    beforeEach ->
        Backbone.history.stop() if Backbone.history
    
    ###
    it "should change visible section when clicking tab", ->
        app = new ProjectApplication(new ProjectApplication.Project())
        view = app.router.projectView
        
        expect(view.$('#overview:visible').length).toEqual(1)
        expect(view.$('#configuration:visible').length).toEqual(0)
        
        console.log view.$('#project_bar .tabs .configuration')
        view.$('#project_bar .tabs .configuration').click()
        console.log view.el
        expect(view.$('#overview:visible').length).toEqual(0)
        expect(view.$('#configuration:visible').length).toEqual(1)
        $(view.el).remove()
    ###