import bb.cascades 1.2

Sheet {
    Page {
        titleBar: TitleBar {
            title: qsTr("GamePad Pane")
            dismissAction: ActionItem {
                title: qsTr("Close")
                onTriggered: {
                    close();
                }
            }
            acceptAction: ActionItem {
                title: qsTr("Save")
                onTriggered: {
                    _setting.save_value("gamepad","up",up_textfield.text);
                    _setting.save_value("gamepad","down",down_textfield.text);
                    _setting.save_value("gamepad","right",right_textfield.text);
                    _setting.save_value("gamepad","left",left_textfield.text);
                    _setting.save_value("gamepad","stay",stay_textfield.text);
                    _setting.save_value("gamepad","A",a_textfield.text);
                    _setting.save_value("gamepad","B",b_textfield.text);
                    _setting.save_value("gamepad","X",x_textfield.text);
                    _setting.save_value("gamepad","Y",y_textfield.text);
                    close();
                }
            }
        }
        ScrollView {
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                horizontalAlignment: HorizontalAlignment.Fill
                rightPadding: 20.0
                bottomPadding: 20.0
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/arrow.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        rotationZ: -90.0
                    }
                    TextField {
                        id: up_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad", "up");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/arrow.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        rotationZ: 90.0
                    }
                    TextField {
                        id: down_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad", "down");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/arrow.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        rotationZ: 180.0
                    }
                    TextField {
                        id: left_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad", "left");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/arrow.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    TextField {
                        id: right_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","right");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/button_stay.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    TextField {
                        id: stay_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","stay");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/button_A.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    TextField {
                        id: a_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","A");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/button_B.png"
                        verticalAlignment: VerticalAlignment.Center
                    }
                    TextField {
                        id: b_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","B");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/button_X.png"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                    }
                    TextField {
                        id: x_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","X");
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/button_Y.png"
                        verticalAlignment: VerticalAlignment.Center
                    }
                    TextField {
                        id: y_textfield
                        hintText: qsTr("Enter char or string")
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        onCreationCompleted: {
                            text = _setting.get_value("gamepad","Y");
                        }
                    }
                }
            }
        }
    }
}