import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title: qsTr("Pane List")
    }
    attachedObjects: [
        ComponentDefinition {
            id: switch_page
            source: "asset:///screen/Switch_Page.qml"
        },        
        ComponentDefinition {
            id: gamepad_page
            source: "asset:///screen/GamePad_Page.qml"
        }
    ]
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: qsTr("back")
            onTriggered: {
                _chatmanager.closeSPPConnection();
                navigationPane.pop();
            }
        }
    }
    Container {
    	ListView {
    	    dataModel: XmlDataModel {
            	source: "asset:///data/Pane_Lists_xmldatamodel.xml" 
            }
    		listItemComponents: [
    		    ListItemComponent {
              		StandardListItem {
              		    title: ListItemData.name
                    }
              	}
    		]        	 
    		onTriggered: {
    		    var selecteditem = dataModel.data(indexPath)
    		    if(selecteditem.value == "switch")
                	navigationPane.push(switch_page.createObject());
                if(selecteditem.value == "gamepad")
                    navigationPane.push(gamepad_page.createObject());
          	}
        }        
    }
}
