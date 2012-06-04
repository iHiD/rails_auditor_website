describe "Project", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.Project()).not.toThrow(new TypeError("undefined is not a function"));