describe "ProjectApplication", ->
    it "passes a sanity test", ->
        app = new ProjectApplication()
        expect(app.sanity()).toEqual(true)