

buster.testCase("Graph", {
    setUp: function () {
        this.graph = capillary.graph.create();
        this.formatter = capillary.formatters.ascii.bindGraph(this.graph);
    },

    "should emit dot for commit": function () {
        var commit = { seqId: 0, id: "1234567", message: "Ok" };
        var listener = this.spy();
        this.graph.on("graph:dot", listener);

        this.graph.graphBranch(C.branch.create([commit]));

        var args = listener.args[0];
        assert.calledOnce(listener);
        assert.calledWith(listener, [0, 0]);
    }
});
