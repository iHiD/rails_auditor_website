describe "ProjectViewSpec", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.ProjectView()).not.toThrow(new TypeError("undefined is not a function"))

    it "can be rendered", ->
        new ProjectApplication.ProjectView(new ProjectApplication.Project()).render()
        
    it "should show only overview section", ->
        view = new ProjectApplication.ProjectView(new ProjectApplication.Project()).render()
        $('body').append(view.el)
        expect(view.$('#overview:visible').length).toEqual(1)
        expect(view.$('#configuration:visible').length).toEqual(0)
        $(view.el).remove()
        
    it "should be able to change visible section", ->
        view = new ProjectApplication.ProjectView(new ProjectApplication.Project()).render()
        $('body').append(view.el)
        expect(view.$('#overview:visible').length).toEqual(1)
        expect(view.$('#configuration:visible').length).toEqual(0)
        
        view.showSection('configuration')
        expect(view.$('#overview:visible').length).toEqual(0)
        expect(view.$('#configuration:visible').length).toEqual(1)
        $(view.el).remove()