// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// Internal imports, e.g:
import {submit} from '../components/submit_message'
import { conditions } from '../components/conditions';
import { request_profile_display_accept_or_deny } from '../components/request_profile_display_accept_or_deny';
import { assign_subscription_type_to_account } from '../components/assign_subscription_type_to_account';
import {refresh} from '../components/refresh_messages'
import{initChatroomCable} from '../channels/chatroom_channel'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  conditions();
  request_profile_display_accept_or_deny();
  submit();
  assign_subscription_type_to_account();
  initChatroomCable()
});
