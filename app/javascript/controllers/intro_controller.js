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
      nextLabel: '下一步',
      prevLabel: '上一步',
      skip: '',
      doneLabel: '開始使用吧～',
      steps: [
        {
          intro: '歡迎加入disboard'
        },
        {
          intro: '點擊這裡可以新增專案群組',
          element: '.addboard',
        },
        {
          intro: '點擊這裡可以看到群組裡面的功能總覽',
          element: '.boardlist'
        },
        {
          intro: '點擊這裡可以新增任務',
          element: '.addcard',
        },
        {
          intro: '點擊這裡可以看到你的所有專案群組',
          element: '.user',
        },
        {
          intro: 
          '最後還有網站的快捷鍵：</br>alt+s可以新增狀態</br>alt+c可以新增卡片</br>alt+d可以切換到日曆頁面</br>alt+m可以切換到聊天室</br>alt+w可以切換到任務列表</br>alt+f可以切換到成員</br>alt+q可以切換到儀表',
        },
      ],
    });
    intro.oncomplete(function() {
      // Set introCompleted flag in localStorage
      localStorage.setItem('introCompleted', 'true');
    });

    intro.start();
  }
}
