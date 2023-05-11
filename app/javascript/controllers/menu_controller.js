import { Controller } from "@hotwired/stimulus"
import { Tooltip } from "chart.js";

// Connects to data-controller="menu"
export default class extends Controller {

  showBoard() {
    const subMenuItem = this.element
    const tooltip = subMenuItem.querySelector("div")


    
    // calculate current boardNameTarget top and left
    const subHeight =  subMenuItem.height
    const subWidth =  subMenuItem.width  
    // append 50% left and 50% top to the current tooltip position
    // using element.getBoundingClientRect()
    const BoardNamePos = subMenuItem.getBoundingClientRect();
    // and element.style.top
    tooltip.style.top = `${ BoardNamePos.top -  Math.round(subHeight * 0.5)  }px`
    // element.style.left
    tooltip.style.left = `${ BoardNamePos.left * 0.01 + subWidth  }px`
    
  }

  showTip() {
    const addBoard = this.element
    const tooltipTwo = addBoard.querySelector("div")

    // calculate current boardNameTarget top and left
    const hoverHeight =  addBoard.height
    const hoverWidth =  addBoard.width  
    // append 50% left and 50% top to the current tooltip position
    // using element.getBoundingClientRect()
    const newNamePos = addBoard.getBoundingClientRect();
    // and element.style.top
    tooltipTwo.style.top = `${ newNamePos.top -  Math.round(hoverHeight * 0.5)  }px`
    // element.style.left
    tooltipTwo.style.left = `${ newNamePos.left * 0.01 + hoverWidth  }px`
  }

}
