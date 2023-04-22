// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AosController from "./aos_controller"
application.register("aos", AosController)

import CardFormController from "./card_form_controller"
application.register("card-form", CardFormController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import SortableController from "./sortable_controller"
application.register("sortable", SortableController)
