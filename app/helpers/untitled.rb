build_params = {
  config: {
    location: '',
    name: '',
  },
  app: [
    {
      type: 'hide',
      fieldName: 'status',
      mkpType: 'non_global_interface',
      condition: {
          type: 'loggedInUser',
          criteria: {
            fieldName: 'logged_in_user_data',
            fieldValue: 'm.arvind1904@gmail.com',
            operator: "==",
            fromSnippet: true,
            key: 'email'
          },
          condition_type: 'is'
        }
    }
  ]
}


build_params = {
  "config": {
    "location": "",
    "name": "",
  },
  "app": [
    {
      "condition": {
        "type": "ticket.statusChanged",
        "fieldName": "",
        "criteria": {
          "fieldName": "event.data.new",
          "fieldValue": 3,
          "operator": "!=",
          "fromSnippet": false,
          "key": nil
        },
        "condition_type": "when_changed"
      },

      "actions": [
        { 
          "type": "disable",
          "fieldName": "priority",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "status",
          "mkpType": "non_global_interface"
        }
      ]
    }
  ]
}