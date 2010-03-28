//Ext.BLANK_IMAGE_URL = '/ext-3.1.0/resources/images/default/s.gif';

var makeTree = function (id, columns, dataUrl) {
    var tree = new Ext.ux.tree.ColumnTree({
        rootVisible:false,
        autoScroll:false,
        renderTo: 'treeDiv',
        header: false,
        border: false,
//        height: 600,
//        title: 'Specification',

        columns: columns,

        loader: new Ext.tree.TreeLoader({
            dataUrl: dataUrl,
            requestMethod:'GET',
            nodeParameter:'id',
            baseAttrs:{
                'uiProvider':'col',
                'cls'       :'master-task',
            },
            baseParams:{
                'require[]':['Testsuite', 'Testcase']
            },
            uiProviders:{
                'col': Ext.ux.tree.ColumnNodeUI
            },
            createNode: function(attr) {
                if (attr.type == 'Testcase') {
                    attr.leaf = true;
                    attr.cls = 'file';
                    // attr.checked = false;
                }
                return Ext.tree.TreeLoader.prototype.createNode.call(this, attr);
            }
        }),

        root: new Ext.tree.AsyncTreeNode({
            text: 'dummy',
            id: id
        })
    });
};