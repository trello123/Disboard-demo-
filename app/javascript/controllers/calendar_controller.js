import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core'
import interactionPlugin from '@fullcalendar/interaction'
import dayGridPlugin from '@fullcalendar/daygrid'
import { get, patch } from '@rails/request.js'
import { successNotify, calendarModal } from "utils/notify"

// Connects to data-controller="calendar"
export default class extends Controller {
  initialize() {
    this.calendar = new Calendar(this.element, {
      initialView: 'dayGridMonth',
      contentHeight: 900,
      dayMaxEvents: true,
      locale: 'zh-tw',
      headerToolbar: {
        left: 'dayGridMonth dayGridWeek dayGridDay',
        center: 'title',
        right: 'prev next today'
      },
      // 套件部分翻譯壞了 暫時這樣寫
      buttonText: {
        today: '今天',
        dayGridMonth: '月',
        dayGridWeek: '週',
        dayGridDay: '日'
      },
      plugins: [
        interactionPlugin,
        dayGridPlugin
      ],
      // 啟動拖曳調整日期
      editable: true,
      // 點擊非排程(新增)
      dateClick: function(info) {},
      // 移動event更新
      eventDrop: (info) => {
        const { boardId } = this.element.dataset
        const url = '/api/v1/calendars/'
        patch(url, { query: { boardId, cardId: info.event.extendedProps.publicId, start: info.event.start, end: info.event.end } })
          .then((resp)=> {
            if (resp.ok) {
              successNotify("成功更新時間")
            }
          })
      },
      // 已有排程時 點擊就會有(更改, 刪除)
      eventClick: (info) => {
        const { boardId } = this.element.dataset
        const cardId = info.event.extendedProps.publicId
        const title = info.event.title
        calendarModal(boardId, cardId, info.event, (daybegin, deadline) => {
          this.updateEvent(cardId, title, daybegin, deadline)
          successNotify("成功更新")
        })
      }
    })
  }

  connect() {
    const { boardId } = this.element.dataset
    //取得api
    const url = '/api/v1/calendars'
    get(url, { query: { boardId } })
      .then((resp)=> {
        if (resp.ok) {
          return resp.json
        }
      })
      .then(({ cards }) => {
        cards?.forEach((card) => {
          this.addEvent(card)
        })
      })

    this.calendar.render()
  }

  addEvent({ id, title, daybegin, deadline }) {
    if (daybegin) {
      deadline = deadline || daybegin
      let newEvent = {
        title,
        publicId: id,
        start: this.fixedTime(daybegin, "start"),
        end: this.fixedTime(deadline, "end"),
      }

      this.calendar.addEvent(newEvent)
    }
  }

  removeEvent(id) {
    const events = this.calendar.getEvents()
    const eventToRemove = events.find(event => event.extendedProps.publicId === id)
    if (eventToRemove) {
      eventToRemove.remove()
    }
  }

  updateEvent(id, title, daybegin, deadline) {
    this.removeEvent(id)
    this.addEvent({ id, title, daybegin, deadline })
  }

  // 修正同一時間可能顯示錯誤問題
  fixedTime(time, type) {
    const regex = /\.(\d{3})/;
    if (type == "start") {
      return time.replace(regex, '.000');
    }

    return time.replace(regex, '.999');
  }
}
