Ext.require([
    'Ext.form.*',
    'Ext.data.*'
]);

Ext.onReady(function(){
Ext.define('Example', {
  extend:'Ext.data.Model',
  fields:[
    {name:'id',type:'int'},
    {name:'name',type:'string'},
    {name:'brief',type:'string'},
    {name:'show',type:'boolean'}
  ],
  idProperty:'id',
  proxy:{type:'rest',url:'/examples',fornat:'json'}
});

      var store = Ext.create('Ext.data.Store', {
          model: 'Example'
          ,
          autoLoad: true
      });
   
      // Simple ComboBox using the data store
      var find_combo = Ext.create('Ext.form.field.ComboBox', {
        store:store,
        valueField: 'id',
        displayField: 'name',
        loadingText: 'Searching...',
        hideLabel: true,
        minChars:2,
        width: 300,
        pageSize: 20,
        listWidth: 350,
        hideTrigger: false,
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
            }
          }
        }
      });

    Ext.define('example', {
        extend: 'Ext.data.Model',
        fields: [
            {name: 'first'},
            {name: 'last'},
            'company', 'email', 'state',
            {name: 'dob', type: 'date', dateFormat: 'm/d/Y'}
        ]
    });2

    var formPanel = Ext.create('Ext.form.Panel', {
        renderTo: 'form-ct',
        frame: true,
        title:'Form',
        width: 340,
        bodyPadding: 5,
        waitMsgTarget: true,

        fieldDefaults: {
            labelAlign: 'right',
            labelWidth: 85,
            msgTarget: 'side'
        },
        dockedItems: [{
          xtype: 'toolbar',
          dock: 'top',
          items: find_combo
        }],
        items: [{
            xtype: 'fieldset',
            title: 'Contact Information',
            defaultType: 'textfield',
            defaults: {
                width: 280
            },
            items: [{
                    fieldLabel: 'First Name',
                    emptyText: 'First Name',
                    name: 'first'
                }, {
                    fieldLabel: 'Last Name',
                    emptyText: 'Last Name',
                    name: 'last'
                }, {
                    fieldLabel: 'Company',
                    name: 'company'
                }, {
                    fieldLabel: 'Email',
                    name: 'email',
                    vtype:'email'
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Date of Birth',
                    name: 'dob',
                    allowBlank: false,
                    maxValue: new Date()
                }
            ]
        }]
    });

});