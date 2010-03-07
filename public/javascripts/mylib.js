//Ext.BLANK_IMAGE_URL = '/ext-3.1.0/resources/images/default/s.gif';

function makeTree() {
    var tree = new Ext.ux.tree.ColumnTree({
        rootVisible:false,
        autoScroll:false,
        renderTo: 'treeDiv',
        header: false,
        border: false,
//        height: 600,
//        title: 'Specification',

        columns:[{
            header:'Name',
            width:200,
            dataIndex:'name'
        },{
            header:'Notes',
            width:200,
            dataIndex:'notes'
        },{
            header:'Summary',
            width:300,
            dataIndex:'summary'
        },{
            header:'Steps',
            width:300,
            dataIndex:'steps'
        }],

        loader: new Ext.tree.TreeLoader({
            dataUrl:function(obj){
                return 'nodes/' + obj.argument.node.id + '/children.json';
            },
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
                    attr.checked = false;
                }
                return Ext.tree.TreeLoader.prototype.createNode.call(this, attr);
            }
        }),

        root: new Ext.tree.AsyncTreeNode({
            text:'dummy',
            id:1
        })
    });
}