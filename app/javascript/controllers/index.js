// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

// Modal Pop Up
const buttons = document.querySelectorAll('.btn-list button');
const modal = document.querySelector('.modal');
buttons.forEach(button => {
  button.addEventListener('click', (event) => {
    modal.classList.remove('hide')
    const t = event.target.getAttribute('data-attribute');
    modal.querySelector('p').innerHTML = t;
  })
});

const close = document.querySelector('.close');
close.addEventListener('click', (event) => {
  modal.classList.toggle('hide');
})
