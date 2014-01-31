import bb.cascades 1.2
import bb.system 1.2
NavigationPane {
    id: navigationPane
    onPopTransitionEnded: page.destroy()
    peekEnabled: false
    Page {
        attachedObjects: [
            SystemToast {
                id: toast 
            },
            ComponentDefinition {
                id: pane_choose_page
                source: "asset:///screen/Pane_Choose_Page.qml"
            }        
        ]
        titleBar: TitleBar {
            title: qsTr("Home")
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            leftPadding: 20.0
            rightPadding: 20.0
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }   
                preferredHeight: 150.0
                maxHeight: 150.0
                minHeight: 150.0
                horizontalAlignment: HorizontalAlignment.Fill
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    ImageView {
                        imageSource: "asset:///images/bluetooth_icon.png"
                        preferredWidth: 130.0
                        preferredHeight: 130.0
                        translationX: 10.0
                        translationY: 10.0
                    }   
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.TopToBottom
                        }
                        translationX: 10.0
                        Label {
                            text: qsTr("Device Name")
                            textStyle.fontSize: FontSize.Small
                            textStyle.color: Color.DarkGray
                            translationY: 20.0
                        }
                        Label {
                            id: device_name_label
                            textStyle.fontSize: FontSize.XLarge
                        }
                    }
                }
            }
            Container {
                layout: DockLayout {
                }
                preferredHeight: 100.0
                maxHeight: 100.0
                minHeight: 100.0
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        text: qsTr("Mac Address:")
                    }
                    Label {
                        id: mac_address_label
                    }
                }
                Divider {
                }
                Divider {
                    verticalAlignment: VerticalAlignment.Bottom
                }
            }
            Container {
                layout: DockLayout {
                }
                preferredHeight: 100.0
                maxHeight: 100.0
                minHeight: 100.0
                Label {
                    text: qsTr("Bluetooth Power:")
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                }
                ToggleButton {
                    id: bt_power_tb
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Right
                    onCheckedChanged: {
                        _home.change_bt_power(checked)
                    }            
                }
                Divider {
                    verticalAlignment: VerticalAlignment.Bottom
                }
            }
            Container {
                layout: DockLayout {
                }
                preferredHeight: 100.0
                maxHeight: 100.0
                minHeight: 100.0
                Label {
                    text: qsTr("Bluetooth Discoverable:")
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                }
                ToggleButton {
                    id: bt_discoverable_tb
                    enabled: bt_power_tb.checked
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Right
                    onCheckedChanged: {
                        _home.change_bt_discoverable(checked)
                    }  
                }
                Divider {
                    verticalAlignment: VerticalAlignment.Bottom
                }
            }
            ListView {
                id: saved_devices_listview
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: ListItemData.deviceName
                            description: ListItemData.deviceAddress
                            status: ListItemData.deviceType
                            imageSource: "asset:///images/bluetooth_device.png"
                        }
                    }
                ]
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    _chatmanager.setRemoteAddress(selectedItem.deviceAddress);
                    if(_chatmanager.connectToSPPService())
                        navigationPane.push(pane_choose_page.createObject())
                }
            }
        }
        actions: [
            ActionItem {
                title: qsTr("Search Devices")
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    if(!bt_power_tb.checked)
                    {
                        toast.body = qsTr("Bluetooth is poweroff")
                        toast.exec();
                    }
                    _home.discover();
                }
            }
        ]
        onCreationCompleted: {
            _home.init(device_name_label,mac_address_label,saved_devices_listview,bt_power_tb,bt_discoverable_tb);
        }
    }
}