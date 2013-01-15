Ext.require([
    'Ext.data.Store',
    'Ext.util.Format',
    'Ext.grid.Panel',

    'Ext.form.*',
    'Ext.data.*',
]);

Ext.onReady(function(){
Ext.define('Example', {
  extend:'Ext.data.Model',
  fields:[
    {name:'id',type:'int'},
    {name:'name',type:'string'},
    {name:'brief',type:'string'},
    {name:'show',type:'bool'},
    {name:'date',type:'date'}
  ],
  idProperty:'id',
  proxy:{type:'rest',url:'/examples',format:'json'}
});

      var me = this;
      var store = Ext.create('Ext.data.Store', {
          model: 'Example'
          ,
          autoLoad: true
      });
      store.load();
      // Simple ComboBox using the data store
      var find_combo = Ext.create('Ext.form.field.ComboBox', {
        valueField: 'id',
        displayField: 'name',
        loadingText: 'Searching...',
        hideLabel: true,
        minChars:2,
        width: 300,
        pageSize: 20,
        listWidth: 350,
        hideTrigger: false,
        store:  Ext.create('Ext.data.Store', {
          model: 'Example',
          autoLoad:true
        }),
        //tpl: find_template,
        //itemSelector: 'div.search-item',
        emptyText: 'Search by name, company or ID...',
        listConfig: {
          loadingText: 'Searching...',
          emptyText: 'No matching customers found.',
        }, 
        listeners: {
          select: {
            fn: function(combo, records) {
              Example.load(records[0].data.id, {
                success: function(record) {}
              });
              formPanel.enable();
              me.example = Ext.create('Example',records[0].data,records[0].data.id)
              formPanel.loadRecord(records[0])

            }
          }
        }
      });

    // Ext.define('example', {
    //     extend: 'Ext.data.Model',
    //     fields: [
    //         {name: 'name'},
    //         {name: 'brief'},
    //         'show',
    //         {name: 'date', type: 'date', dateFormat: 'm/d/Y'}
    //     ]
    // });2

    var formPanel = Ext.create('Ext.form.Panel', {
        renderTo: 'form-ct',
        frame: true,
        title:'Form',
        width: 520,
        bodyPadding: 5,
        waitMsgTarget: true,

        fieldDefaults: {
            labelAlign: 'right',
            labelWidth: 85,
            msgTarget: 'side'
        },
        dockedItems: [{
          dock: 'top',
          xtype: 'toolbar',
          items: [{
            text:'Add',
            tooltip:'Add a new spotlight',
            iconCls:'add',
            handler: function() {
              console.log('adding new guy');
              me.example = Ext.create('Example', {
                title : '',
                brief:'',
                date:'',
                show:''
              });
              formPanel.loadRecord(me.example)
            }
          }, '-', {
            text:'Save',
            tooltip:'Save the current record',
            iconCls:'save',
            handler: function(widget,event) {
              formPanel.getForm().updateRecord(me.example)
              // me.example.updated_at = new date();
              console.log('example ' + me.example.getId() + ' set')
              me.example.save();
            }
          },'-',{
            text:'Remove',
            tooltip:'Remove the example',
            iconCls:'remove'
          },
          find_combo]
        }],
        items: [{
            xtype: 'fieldset',
            title: 'Example Information',
            defaultType: 'textfield',
            defaults: {
                width: 280
            },
            items: [{
                    fieldLabel: 'Name',
                    emptyText: 'Name',
                    name: 'name'
                }, {
                    fieldLabel: 'description',
                    emptyText: 'description',
                    name: 'brief'
                }, {
                    fieldLabel: 'show',
                    name: 'show',
                    xtype: 'checkbox'
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Date created',
                    name: 'date'
                }
            ]
        }]
    });
});
