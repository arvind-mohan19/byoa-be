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
    "location": "ticket_background",
    "name": ""
  },
  "app": [
    {
      "condition": {
        "type": "ticket",
        "fieldName": "",
        "criteria": {
          "fieldName": "ticket_data",
          "fieldValue": "hi",
          "operator": "==",
          "fromSnippet": true,
          "key": "subject"
        },
        "condition_type": "is"
      },

      "actions": [
        { 
          "type": "hide",
          "fieldName": "priority",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "status",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "group",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "ticket_type",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "ticketSpam",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "ticketEdit",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "ticketDelete",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "tag",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "reply",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "forward",
          "mkpType": "non_global_interface"
        },
        { 
          "type": "hide",
          "fieldName": "note",
          "mkpType": "non_global_interface"
        }
      ]
    }
  ]
}