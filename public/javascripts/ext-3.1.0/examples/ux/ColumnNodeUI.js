/*!
 * Ext JS Library 3.1.0
 * Copyright(c) 2006-2009 Ext JS, LLC
 * licensing@extjs.com
 * http://www.extjs.com/license
 */
Ext.ns('Ext.ux.tree');

/**
 * @class Ext.ux.tree.ColumnTree
 * @extends Ext.tree.TreePanel
 * 
 * @xtype columntree
 */
Ext.ux.tree.ColumnTree = Ext.extend(Ext.tree.TreePanel, {
    lines : false,
    borderWidth : Ext.isBorderBox ? 0 : 2, // the combined left/right border for each cell
    cls : 'x-column-tree',

    cellSelectorMaxDepth : 4,
    cellClass : 'x-tree-hd',
//    colRe : new RegExp('x-tree-hd', ''),
    enableColumnResize : true,

    onRender : function(){
        Ext.tree.ColumnTree.superclass.onRender.apply(this, arguments);
        this.headers = this.header.createChild({cls:'x-tree-headers'});

        var cols = this.columns, c;
        var totalWidth = 0;
        var scrollOffset = 19; // similar to Ext.grid.GridView default

        for(var i = 0, len = cols.length; i < len; i++){
             c = cols[i];
             totalWidth += c.width;
             this.headers.createChild({
                 cls:'x-tree-hd ' + (c.cls?c.cls+'-hd':''),
                 cn: {
                     cls:'x-tree-hd-text',
                     html: c.header
                 },
                 style:'width:'+(c.width-this.borderWidth)+'px;'
             });
        }
        this.headers.createChild({cls:'x-clear'});
        // prevent floats from wrapping when clipped
        this.headers.setWidth(totalWidth+scrollOffset);
        this.innerCt.setWidth(totalWidth);

        this.headers.on({
            scope: this,
            mouseover: this.handleHdOver,
            mouseout:  this.handleHdOut,
            mousemove: this.handleHdMove
        });

        this.resizeMarker = this.header.createChild({cls:'x-grid3-resize-marker'});
        this.resizeProxy  = this.header.createChild({cls:'x-grid3-resize-proxy'});
        this.splitZone = new Ext.ux.tree.ColumnTree.SplitDragZone(this, this.headers.dom);
    },
    // private
    fly : function(el){
        if(!this._flyweight){
            this._flyweight = new Ext.Element.Flyweight(document.body);
        }
        this._flyweight.dom = el;
        return this._flyweight;
    },
    // private
    findCell : function(el){
        if(!el){
            return false;
        }
        return this.fly(el).findParent('.' + this.cellClass, this.cellSelectorMaxDepth);
    },

    // private
    findHeaderCell : function(el){
        var cell = this.findCell(el);
        return cell && this.fly(cell).hasClass(this.cellClass) ? cell : null;
    },

    findCellIndex : function(el, requiredCls){
        var cell = this.findCell(el);
        if(cell && (!requiredCls || this.fly(cell).hasClass(requiredCls))){
            return this.getCellIndex(cell);
        }
        return false;
    },

    // private
    getCellIndex : function(el){
        if(el){
            var m = el.className.match(this.colRe);
            if(m && m[1]){
                return this.cm.getIndexById(m[1]);
            }
        }
        return false;
    },
    // private
    handleHdOver : function(e, t){
        var hd = this.findHeaderCell(t);
        if(hd && !this.headersDisabled){
            this.activeHdRef = t;
            var fly = this.fly(hd);
            this.activeHdRegion = fly.getRegion();
        }
    },
    // private
    handleHdMove : function(e, t){
        var hd = this.findHeaderCell(this.activeHdRef);
        if(hd && !this.headersDisabled){
            var hw = this.splitHandleWidth || 5,
                r = this.activeHdRegion,
                x = e.getPageX(),
                ss = hd.style,
                cur = '';
            if(this.enableColumnResize !== false){
                if(x - r.left <= hw){
                    cur = Ext.isAir ? 'move' : Ext.isWebKit ? 'e-resize' : 'col-resize'; // col-resize not always supported
                }else if(r.right - x <= (!this.activeHdBtn ? hw : 2)){
                    cur = Ext.isAir ? 'move' : Ext.isWebKit ? 'w-resize' : 'col-resize';
                }
            }
            ss.cursor = cur;
        }
    },
    // private
    handleHdOut : function(e, t){
        var hd = this.findHeaderCell(t);
        if(hd && (!Ext.isIE || !e.within(hd, true))){
            this.activeHdRef = null;
            hd.style.cursor = '';
        }
    },
});

Ext.reg('columntree', Ext.ux.tree.ColumnTree);

//backwards compat
Ext.tree.ColumnTree = Ext.ux.tree.ColumnTree;


/**
 * @class Ext.ux.tree.ColumnNodeUI
 * @extends Ext.tree.TreeNodeUI
 */
Ext.ux.tree.ColumnNodeUI = Ext.extend(Ext.tree.TreeNodeUI, {
    focus: Ext.emptyFn, // prevent odd scrolling behavior

    renderElements : function(n, a, targetNode, bulkRender){
        this.indentMarkup = n.parentNode ? n.parentNode.ui.getChildIndent() : '';

        var t = n.getOwnerTree();
        var cols = t.columns;
        var bw = t.borderWidth;
        var c = cols[0];
        var cb = Ext.isBoolean(a.checked);

        var buf = [
             '<li class="x-tree-node"><div ext:tree-node-id="',n.id,'" class="x-tree-node-el x-tree-node-leaf ', a.cls,'">',
                '<div class="x-tree-col" style="width:',c.width-bw,'px;">',
                    '<span class="x-tree-node-indent">',this.indentMarkup,"</span>",
                    '<img src="', this.emptyIcon, '" class="x-tree-ec-icon x-tree-elbow">',
                    '<img src="', a.icon || this.emptyIcon, '" class="x-tree-node-icon',(a.icon ? " x-tree-node-inline-icon" : ""),(a.iconCls ? " "+a.iconCls : ""),'" unselectable="on">',
                    cb ? ('<input class="x-tree-node-cb" type="checkbox" ' + (a.checked ? 'checked="checked" />' : '/>')) : '',
                    '<a hidefocus="on" class="x-tree-node-anchor" href="',a.href ? a.href : "#",'" tabIndex="1" ',
                    a.hrefTarget ? ' target="'+a.hrefTarget+'"' : "", '>',
                    '<span unselectable="on">', n.text || (c.renderer ? c.renderer(a[c.dataIndex], n, a) : a[c.dataIndex]),"</span></a>",
                "</div>"];
         for(var i = 1, len = cols.length; i < len; i++){
             c = cols[i];

             buf.push('<div class="x-tree-col ',(c.cls?c.cls:''),'" style="width:',c.width-bw,'px;">',
                        '<div class="x-tree-col-text">',(c.renderer ? c.renderer(a[c.dataIndex], n, a) : a[c.dataIndex]),"</div>",
                      "</div>");
         }
         buf.push(
            '<div class="x-clear"></div></div>',
            '<ul class="x-tree-node-ct" style="display:none;"></ul>',
            "</li>");

        if(bulkRender !== true && n.nextSibling && n.nextSibling.ui.getEl()){
            this.wrap = Ext.DomHelper.insertHtml("beforeBegin",
                                n.nextSibling.ui.getEl(), buf.join(""));
        }else{
            this.wrap = Ext.DomHelper.insertHtml("beforeEnd", targetNode, buf.join(""));
        }

        this.elNode = this.wrap.childNodes[0];
        this.ctNode = this.wrap.childNodes[1];
        var cs = this.elNode.firstChild.childNodes;
        this.indentNode = cs[0];
        this.ecNode = cs[1];
        this.iconNode = cs[2];
        var index = 3;
        if(cb){
            this.checkbox = cs[3];
            // fix for IE6
            this.checkbox.defaultChecked = this.checkbox.checked;
            index++;
        }
        this.anchor = cs[index];
        this.textNode = cs[index].firstChild;
    }
});

//backwards compat
Ext.tree.ColumnNodeUI = Ext.ux.tree.ColumnNodeUI;

// private
// This is a support class used internally by the Grid components
Ext.ux.tree.ColumnTree.SplitDragZone = function(tree, hd){
    this.tree = tree;
    this.marker = this.tree.resizeMarker;
    this.proxy = this.tree.resizeProxy;
    Ext.ux.tree.ColumnTree.SplitDragZone.superclass.constructor.call(this, hd,
        'treeSplitters' + this.tree.getTreeEl().id, {
        dragElId : Ext.id(this.proxy.dom), resizeFrame:false
    });
    this.scroll = false;
    this.hw = this.splitHandleWidth || 5;
};
Ext.extend(Ext.ux.tree.ColumnTree.SplitDragZone, Ext.dd.DDProxy, {

    b4StartDrag : function(x, y){
        this.tree.headersDisabled = true;
        var h = this.mainWrap.getHeight();
        this.marker.setHeight(h);
        this.marker.show();
        this.marker.alignTo(this.tree.getHeaderCell(this.cellIndex), 'tl-tl', [-2, 0]);
        this.proxy.setHeight(h);
        var w = this.cm.getColumnWidth(this.cellIndex);
        var minw = Math.max(w-this.tree.minColumnWidth, 0);
        this.resetConstraints();
        this.setXConstraint(minw, 1000);
        this.setYConstraint(0, 0);
        this.minX = x - minw;
        this.maxX = x + 1000;
        this.startPos = x;
        Ext.dd.DDProxy.prototype.b4StartDrag.call(this, x, y);
    },

    allowHeaderDrag : function(e){
        return true;
    },


    handleMouseDown : function(e){
        var t = this.tree.findHeaderCell(e.getTarget());
        if(t && this.allowHeaderDrag(e)){
            var xy = this.tree.fly(t).getXY(), x = xy[0], y = xy[1];
            var exy = e.getXY(), ex = exy[0];
            var w = t.offsetWidth, adjust = false;
            if((ex - x) <= this.hw){
                adjust = -1;
            }else if((x+w) - ex <= this.hw){
                adjust = 0;
            }
            if(adjust !== false){
                this.cm = this.tree.colModel;
                var ci = this.tree.getCellIndex(t);
                if(adjust == -1){
                  if (ci + adjust < 0) {
                    return;
                  }
                    while(this.cm.isHidden(ci+adjust)){
                        --adjust;
                        if(ci+adjust < 0){
                            return;
                        }
                    }
                }
                this.cellIndex = ci+adjust;
                this.split = t.dom;
                if(this.cm.isResizable(this.cellIndex) && !this.cm.isFixed(this.cellIndex)){
                    Ext.ux.tree.ColumnTree.SplitDragZone.superclass.handleMouseDown.apply(this, arguments);
                }
            }else if(this.columnDrag){
                this.columnDrag.callHandleMouseDown(e);
            }
        }
    },

    endDrag : function(e){
        this.marker.hide();
        var endX = Math.max(this.minX, e.getPageX());
        var diff = endX - this.startPos;
        this.tree.onColumnSplitterMoved(this.cellIndex, this.cm.getColumnWidth(this.cellIndex)+diff);
        setTimeout(function(){
            this.tree.headersDisabled = false;
        }, 50);
    },

    autoOffset : function(){
        this.setDelta(0,0);
    }
});
