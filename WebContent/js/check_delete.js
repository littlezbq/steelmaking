/**
 * 此程序为删除时弹出确认对话框
 */

    window.onload = function(){
        //删除时弹出确认对话框*******************************************
        document.getElementById("deleteConfirmation").onclick = function(){//删除单击
                if(window.confirm(this.getAttribute("data-msg"))){//弹出删除确认框
                    
                    alert("删除成功！");
                }
	           

        }
    };
