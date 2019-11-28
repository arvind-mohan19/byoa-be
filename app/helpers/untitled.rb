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
  config: {
    location: '',
    name: '',
  },
  app: [
    {
      type: 'disable',
      fieldName: 'priority',
      mkpType: 'non_global_interface',
      condition: {
          type: 'events_changed_api',
          fieldName: '',
          criteria: {
            fieldName: 'events_changed_api',
            fieldValue: 'ticket.statusChanged',
            operator: "==",
            fromSnippet: false,
            key: 'email'
          },
          condition_type: 'when_changed'
        }
    }
  ]
}