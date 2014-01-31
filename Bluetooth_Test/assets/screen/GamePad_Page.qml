import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title: qsTr("GamePad Pane")
    }
    Container {
        layout: DockLayout {
        }
        leftPadding: 20.0
        rightPadding: 20.0
        Container {
            minWidth: 500.0
            minHeight: 500.0
            preferredWidth: 500.0
            maxWidth: 500.0
            preferredHeight: 500.0
            maxHeight: 500.0
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Left
            layout: DockLayout {
            }
            Container {
                attachedObjects: [
                    ImagePaintDefinition {
                        id: pad_imagepaintdefinition
                        imageSource: "asset:///images/pad.jpg"
                        repeatPattern: RepeatPattern.XY
                    }
                ]
                id: container
                preferredWidth: 200.0
                minHeight: 200.0
                preferredHeight: 200.0
                maxHeight: 200.0
                maxWidth: 200.0
                minWidth: 200.0
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                onTouch: {
                    console.log("x = " + event.localX + "," + "Y = " + event.localY);
                    translationX = event.localX - 100;
                    translationY = event.localY - 100;
                    if(event.localX < 10)
                        _chatmanager.sendSPPMessage(_setting.get_value("gamepad","left"));
                    else if(event.localX > 180)
                        _chatmanager.sendSPPMessage(_setting.get_value("gamepad","right"));
                    else if(event.localY < 100)
                        _chatmanager.sendSPPMessage(_setting.get_value("gamepad","up"));
                    else if(event.localY > 190)
                        _chatmanager.sendSPPMessage(_setting.get_value("gamepad","donwn"));
                    else 
                        _chatmanager.sendSPPMessage(_setting.get_value("gamepad","stay"));
                    if (event.isCancel() || event.isUp()) 
                    {
                        translationX = 0;
                        translationY = 0;
                    }
                }
                background: pad_imagepaintdefinition.imagePaint
                scaleX: 1.5
                scaleY: 1.5
            }
        }
        Container {
            layout: DockLayout {
            }
            minWidth: 350.0
            minHeight: 350.0
            preferredWidth: 350.0
            maxWidth: 350.0
            preferredHeight: 350.0
            maxHeight: 350.0
            horizontalAlignment: HorizontalAlignment.Right
            verticalAlignment: VerticalAlignment.Center
            rotationZ: 65.0
            translationX: -40.0
            ImageButton {
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Left
                defaultImageSource: "asset:///images/button_B.png"
                rotationZ: -65.0
                onClicked: {
                    _chatmanager.sendSPPMessage(_setting.get_value("gamepad","B"));
                }
            }
            ImageButton {
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Right
                defaultImageSource: "asset:///images/button_Y.png"
                rotationZ: -65.0
                onClicked: {
                    _chatmanager.sendSPPMessage(_setting.get_value("gamepad","Y"));
                }
            }
            ImageButton {
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Left
                defaultImageSource: "asset:///images/button_A.png"
                rotationZ: -65.0
                onClicked: {
                    _chatmanager.sendSPPMessage(_setting.get_value("gamepad","A"));
                }
            }
            ImageButton {
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Right
                defaultImageSource: "asset:///images/button_X.png"
                rotationZ: -65.0
                onClicked: {
                    _chatmanager.sendSPPMessage(_setting.get_value("gamepad","X"));
                }
            }
        }
    }
}
