import { Controller } from "@hotwired/stimulus"
import introJs from 'intro.js'

// Connects to data-controller="intro"
export default class extends Controller {
  connect() {
    const intro = introJs();
    const introCompleted = localStorage.getItem('introCompleted');
    if (introCompleted) {
      return; // Exit the function if intro has already been completed
    }
    intro.setOptions({
      exitOnOverlayClick: false,
      showStepNumbers: true,
      disableInteraction: true,
      highlightClass: 'custom-highlight',
      tooltipClass: 'usertheach',
      nextLabel: '下一步',
      prevLabel: '上一步',
      doneLabel: '開始使用吧～',
      steps: [
        {
          title: '歡迎加入disboard',
          intro: '使用教學'
        },
        {
          title: '步驟一: 新增專案群組',
          intro: '點擊這裡可以新增專案群組',
          element: '.addboard',
        },
        {
          title: '步驟二: 群組功能總覽',
          intro: '點擊這裡可以看到群組裡面的功能總覽',
          element: '.boardlist'
        },
        {
          title: '步驟三: 新增專案任務',
          intro: '點擊這裡可以新增任務',
          element: '.addcard',
        },
        {
          title: '步驟四: 個人所有專案群組',
          intro: '點擊這裡可以看到你的所有專案群組',
          element: '.user',
        },
        {
          title: '步驟五: 快捷鍵教學',
          intro: 
          '最後還有網站的快捷鍵：<p>Option(或 Alt鍵)<code>⌥ + s</code></br>-> 新增狀態</p><p>Option(或 Alt鍵) <code>⌥ + c </code></br>-> 新增卡片</p><p>Option(或 Alt鍵)<code> ⌥ + w </code></br>-> 切換到日曆頁面</p><p>Option(或 Alt鍵)<code> ⌥ + e </code></br>-> 切換到聊天室</p><p>Option(或 Alt鍵) <code>⌥ + q </code></br>-> 切換到任務列表</p><p>Option(或 Alt鍵)<code> ⌥ + r</code></br>-> 切換到成員</p><p>Option(或 Alt鍵)<code>⌥ + t</code></br>-> 切換到儀表</p>',
        },
      ],
    });
    intro.oncomplete(function() {
      // Set introCompleted flag in localStorage
      localStorage.setItem('introCompleted', 'true');
    })  
    intro.onbeforeexit(function() {
      localStorage.setItem('introCompleted', 'true');
    })

    intro.start();
  }
}
