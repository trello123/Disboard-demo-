import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hotkey"
export default class extends Controller {
  connect() {
    document.addEventListener("keydown", function(event) {
      if (event.altKey) {
        switch (event.code) {
          // 新增卡片
          case "KeyC":
            handleShortcut("keyone");
            break;
          // 新增狀態
          case "KeyS":
            handleShortcut("keytwo");
            break;
          // 切換日曆
          case "KeyD":
            handleShortcut("keythree");
            break;
          // 切換到聊天室
          case "KeyM":
            handleShortcut("keyfour");
            break;
          // 切換到成員
          case "KeyF":
            handleShortcut("keyfive");
            break;
          // 切換到任務
          case "KeyW":
            handleShortcut("keysix");
            break;
          case "KeyQ":
            handleShortcut("keyseven");
            break;
        }
      }
    });
    
    function handleShortcut(linkId) {
      event.preventDefault();
      
      const link = document.getElementById(linkId);
      
      if (link) {
        link.click();
      }
    }

  }
}
