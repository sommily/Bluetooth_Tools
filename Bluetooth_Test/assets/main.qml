import bb.cascades 1.2
import "./screen/"

TabbedPane {
    Tab {
        title: qsTr("Home")
        Home_Page {
            
        }
    }
    Tab {
        title: qsTr("Setting")
    	Setting_Page {
         
        }    	       
    }
}