import bb.cascades 1.2

Sheet {
    peekEnabled: false
    onOpenedChanged: {
        if(opened)
        	console.log("sheet opened");
    }
    Page {
        titleBar: TitleBar {
            title: qsTr("Switch Pane")
            dismissAction: ActionItem {
                title: qsTr("Close")
                onTriggered: {
                    close();
                }
            }
            acceptAction: ActionItem {
            	title: qsTr("Save")
                onTriggered: {
                    _setting.save_value("switch","off",off_textfield.text);
                    _setting.save_value("switch","on",on_textfield.text);
                    close();
                }
            }
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            horizontalAlignment: HorizontalAlignment.Fill
            rightPadding: 20.0
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Fill
                ImageView {
                    imageSource: "asset:///images/light_off.png"
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                }
                TextField {
                    id: off_textfield
                    hintText: qsTr("Enter char or string")
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    onCreationCompleted: {
                        text = _setting.get_value("switch","off");
                    }
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Fill
                ImageView {
                    imageSource: "asset:///images/light_on.png"
                    verticalAlignment: VerticalAlignment.Center
                }
                TextField {
                    id: on_textfield
                    hintText: qsTr("Enter char or string")
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    onCreationCompleted: {
                        text = _setting.get_value("switch","on");
                    }
                }
            }
        }
    }
}