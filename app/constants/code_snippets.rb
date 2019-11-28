module CodeSnippets
  BaseCode = "$(document).ready( function() { app.initialized() .then(function(_client) { var client = _client; %{app_code} }); });"
  MarketplaceSnippets = {
    "non_global_interface_api": {
      "hide": "client.interface.trigger('hide', {id: '%{element}'})",
      "show": "client.interface.trigger('show', {id: '%{element}'})",
      "disable": "client.interface.trigger('disable', {id: '%{element}'})",
      "enable": "client.interface.trigger('enable', {id: '%{element}'})",
      "setOptions": "client.interface.trigger('setOptions', {id: '%{element}'})"
    },

    "data_api": "client.data.get('%{type}').then (function(data) { %{code_block} });",

    "events_changed_api": "var eventCallback = function (event) { var event_data = event.helper.getData(); %{code_block}}; client.events.on('%{type}', eventCallback);",

    "events_click_api": "var eventCallback = function (event) { %{code_block}}; client.events.on('%{type}', eventCallback);",

    "event_data": "event_data.new",

    "logged_in_user_data": "data['loggedInUser']['contact']['%{key}']",
    "domain_name_data": "data['%{key}']",
    "ticket_data": "data['ticket']['%{key}']",
  }
  GeneralSnippets = {
    "condition": "%{name} %{operator} '%{value}'",
    "if_clause": "if(%{condition}) { %{code_block} }"
  }

  Manifest = {
    "platform-version": "2.0",
    "product": {
      "freshdesk": {
        "location": {
          "%{location}": {
            "url": "template.html"
          }
        }
      }
    }
  }


  Readme = "## Your First App

  Congratulations on creating your first app! Feel free to replace this text with your app's actual description.

  ### Folder structure explained

    .
    ├── README.md                  This file
    ├── app                        Contains the files that are required for the front end component of the app
    │   ├── app.js                 JS to render the dynamic portions of the app
    │   ├── icon.svg               Sidebar icon SVG file. Should have a resolution of 64x64px.
    │   ├── freshdesk_logo.png     The Freshdesk logo that is displayed in the app
    │   ├── style.css              Style sheet for the app
    │   ├── template.html          Contains the HTML required for the app’s UI
    ├── config                     Contains the installation parameters and OAuth configuration
    │   ├── iparams.json           Contains the parameters that will be collected during installation
    │   └── iparam_test_data.json  Contains sample Iparam values that will used during testing
    └── manifest.json              Contains app meta data and configuration information"


  Template = '<html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
      <script src="https://static.freshdev.io/fdk/2.0/assets/fresh_client.js"></script>
      <script src="app.js"></script>
      <link rel="stylesheet" type="text/css" href="style.css">
      <link rel="stylesheet" type="text/css" href="https://static.freshdev.io/fdk/2.0/assets/freshdesk.css">
    </head>
    <body>
      <div class="fw-widget-wrapper">
        <div class="logo"></div>
        <p id="apptext"></p>
      </div>
    </body>
  </html>'

  Style = ".logo {
    background: url('%{logo}');
    background-repeat: no-repeat;
    background-size: contain;
    height: 25px;
    margin-top: 25px;
  }"



end