import bb.cascades 1.2
import "../componment/setting"

Page {
    titleBar: TitleBar {
        title: qsTr("Setting")
    }
    attachedObjects: [
        Switch_Set_Sheet {
            id: switch_sheet
        },
        GamePad_Set_Sheet {
            id: gamepad_sheet
        }
    ]
    Container {
       ListView {
           dataModel: XmlDataModel {
               source: "asset:///data/Pane_Lists_xmldatamodel.xml"
           }
           listItemComponents: [
               ListItemComponent {
                   type: "pane"
                   StandardListItem {
                       title: ListItemData.name
                   }
               }
           ]
           onTriggered: {
               if(dataModel.data(indexPath).value == "switch")
               	   switch_sheet.open();
               if(dataModel.data(indexPath).value == "gamepad")
                   gamepad_sheet.open();
           }
       }
    }
}
