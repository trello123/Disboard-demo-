import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'

import { patch } from '@rails/request.js'
// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      //sortable給的動畫
      group: 'shared',
      animation: 150,
      ghostClass: "drag-ghost",
      //sortable給的方法
      onEnd: (e) => {
        const { boardId, containerId } = e.to.dataset
        const { cardId } = e.item.dataset
        //因為排序方式不一樣，newindex是從0開始所以要加一
        const newIndex = e.newIndex + 1
        //取得api
        const url = `/api/v1/cards/${cardId}/sort`
        //用patch方法更新位置x
        patch(url, { body: JSON.stringify({ newIndex, boardId, containerId }) })
      },
    })
  }
}
