import { Controller } from "@hotwired/stimulus";
import { Calendar } from "@fullcalendar/core";
import interactionPlugin from "@fullcalendar/interaction";
import dayGridPlugin from "@fullcalendar/daygrid";
import { get, patch } from "@rails/request.js";

// Connects to data-controller="calendar"
export default class extends Controller {
  initialize() {
    this.level = {
      待確認: "bg-blue-500 border-blue-500",
      簡單: "bg-green-500 border-green-500",
      普通: "bg-yellow-500 border-yellow-500",
      困難: "bg-red-500 border-red-500",
    };
    this.calendar = new Calendar(this.element, {
      initialView: "dayGridMonth",
      contentHeight: 900,
      dayMaxEvents: true,
      locale: "zh-tw",
      headerToolbar: {
        left: "dayGridMonth dayGridWeek dayGridDay",
        center: "title",
        right: "prev next today",
      },
      // 套件部分翻譯壞了 暫時這樣寫
      buttonText: {
        today: "今天",
        dayGridMonth: "月",
        dayGridWeek: "週",
        dayGridDay: "日",
      },
      plugins: [interactionPlugin, dayGridPlugin],
      // 啟動拖曳調整日期
      editable: true,
      // 點擊非排程(新增)
      dateClick: function (info) {},
      // 移動event更新
      eventDrop: function (info) {
        const url = "/api/v1/calendars/";
        patch(url, {
          query: {
            cardId: info.event.extendedProps.publicId,
            start: info.event.start,
            end: info.event.end,
          },
        }).then((resp) => {
          if (resp.ok) {
            alert("成功更新時間");
          }
        });
      },
      // 已有排程時 點擊就會有(更改, 刪除)
      eventClick: (date, event, view) => {},
    });
  }

  connect() {
    //取得api
    const url = "/api/v1/calendars";
    get(url, {})
      .then((resp) => {
        if (resp.ok) {
          return resp.json;
        }
      })
      .then(({ cards }) => {
        cards.forEach((card) => {
          this.addEvent(card);
        });
      });

    this.calendar.render();
  }

  addEvent({ id, title, level, daybegin, deadline }) {
    deadline = deadline || daybegin;
    let newEvent = {
      title,
      publicId: id,
      start: this.fixedTime(daybegin, "start"),
      end: this.fixedTime(deadline, "end"),
      // 自定義顏色
      // className: this.level[level]
    };

    this.calendar.addEvent(newEvent);
  }

  // removeEvent() {
  //   const events = this.calendar.getEvents()
  //   const eventToRemove = events.find(event => event.extendedProps.publicId === 101)
  //   if (eventToRemove) {
  //     eventToRemove.remove()
  //   }
  // }

  // 修正同一時間可能顯示錯誤問題
  fixedTime(time, type) {
    const regex = /\.(\d{3})/;
    if (type == "start") {
      return time.replace(regex, ".000");
    }

    return time.replace(regex, ".999");
  }
}
