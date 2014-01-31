import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title: qsTr("Switch Pane")
    }
    Container {
        layout: DockLayout {
        }
        ImageButton {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            defaultImageSource: "asset:///images/light_off.png"
            pressedImageSource: "asset:///images/light_on.png"
            onClicked: {
                if(defaultImageSource == "asset:///images/light_off.png")
                {
                    defaultImageSource = "asset:///images/light_on.png";
                    pressedImageSource = "asset:///images/light_off.png";
                    _chatmanager.sendSPPMessage(_setting.get_value("switch","on"));
                }
                else 
                {
                    defaultImageSource = "asset:///images/light_off.png";
                    pressedImageSource = "asset:///images/light_on.png";
                    _chatmanager.sendSPPMessage(_setting.get_value("switch","off"));              
                }
            }
        }
    }
}
