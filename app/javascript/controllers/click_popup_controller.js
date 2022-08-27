import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-popup"
export default class extends Controller {
  static targets = ["poster"]

  connect() {
    console.log('Hello you are in the popup controller')
  }

  // Modal Pop Up
  // const buttons = document.querySelectorAll('.btn-list mvbutton');
  // const modal = document.querySelector('.modal');
  // buttons.forEach(button => {
  //   button.addEventListener('click', (event) => {
  //     modal.classList.remove('hide')
  //     const t = event.target.getAttribute('data-attribute');
  //     modal.querySelector('p').innerHTML = t;
  //   })
  // });

  // const close = document.querySelector('.close');
  // close.addEventListener('click', (event) => {
  //   modal.classList.toggle('hide');
  // })
}
