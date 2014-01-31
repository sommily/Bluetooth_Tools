/*
 * Home.cpp
 *
 *  Created on: 2014-1-26
 *      Author: user
 */
#include "Home.hpp"
#include <QDebug>
#include <QObject>
#include <bb/system/SystemDialog>

void BTControllerCallback(const int event, const char *bt_addr, const char *event_data)
{
	Q_UNUSED(event);
	Q_UNUSED(bt_addr);
	Q_UNUSED(event_data);
}

HOME::HOME()
{
	bt_device_init(BTControllerCallback);
    bt_spp_init();
	m_name = "";
	m_mac_address = "";
	m_name_label = NULL;
	m_mac_address_label = NULL;
	m_listview = NULL;
	m_bt_power_togglebutton = NULL;
	m_bt_discoverable_togglebutton = NULL;
	m_datamodel = new bb::cascades::GroupDataModel(QStringList() << "deviceName" << "deviceAddress" << "deviceClass" << "deviceType" << "deviceList");
    m_datamodel->setSortingKeys(QStringList() << "deviceList");
    m_datamodel->setGrouping(bb::cascades::ItemGrouping::ByFullValue);
}

HOME::~HOME()
{
	bt_device_deinit();
	bt_spp_deinit();
}

void HOME::init(QObject *name_label,QObject *mac_address_label,QObject *listview,QObject *bt_power_tb,QObject *bt_discoverable_tb)
{
	m_name_label = dynamic_cast<Label*>(name_label);
	m_mac_address_label = dynamic_cast<Label*>(mac_address_label);
	m_listview = dynamic_cast<ListView*>(listview);
	m_bt_power_togglebutton = dynamic_cast<ToggleButton *>(bt_power_tb);
	m_bt_discoverable_togglebutton = dynamic_cast<ToggleButton *>(bt_discoverable_tb);
	update();
	update_listview();
}

void HOME::update()
{
    char buffer[128];
    const int bufferSize = sizeof(buffer);
    bool ok = false;
    const QString unknown = "Unknown";
    const QString notAvailable = "N/A";
    ok = (bt_ldev_get_friendly_name(buffer, bufferSize) == 0);
    m_name = (ok ? QString::fromLatin1(buffer) : unknown);
    m_name_label->setText(m_name);
    ok = (bt_ldev_get_address(buffer) == 0);
    m_mac_address = (ok ? QString::fromLatin1(buffer) : unknown);
    m_mac_address_label->setText(m_mac_address);
    m_bt_power_togglebutton->setChecked(bt_ldev_get_power());
    m_bt_discoverable_togglebutton->setChecked(!bt_ldev_get_discoverable());
}

void HOME::change_bt_power(bool state)
{
	if(state != bt_ldev_get_power())
	{
		m_bt_power_togglebutton->setChecked(state);
		bt_ldev_set_power(state);
	}
	if(!state)
		change_bt_discoverable(false);
}

void HOME::change_bt_discoverable(bool state)
{
	if(state != bt_ldev_get_discoverable())
	{
		m_bt_discoverable_togglebutton->setChecked(state);
		if(state)
			bt_ldev_set_discoverable(BT_DISCOVERABLE_GIAC);
		else
			bt_ldev_set_discoverable(BT_DISCOVERABLE_CONNECTABLE);
	}
}

void HOME::update_listview()
{
	m_datamodel->clear();
    bt_remote_device_t **remote_device_array;
    bt_remote_device_t *next_remote_device = 0;
    remote_device_array = bt_disc_retrieve_devices(BT_DISCOVERY_PREKNOWN, 0);
    if (remote_device_array)
    {
        for (int i = 0; (next_remote_device = remote_device_array[i]); ++i)
        {
            QVariantMap map;
            char buffer[128];
            const int bufferSize = sizeof(buffer);
            bt_rdev_get_friendly_name(next_remote_device, buffer, bufferSize);
            map["deviceName"] = QString::fromLatin1(buffer);
            bt_rdev_get_address(next_remote_device, buffer);
            map["deviceAddress"] = QString::fromLatin1(buffer);
            map["deviceClass"] = QString::number(bt_rdev_get_device_class(next_remote_device, BT_COD_DEVICECLASS));
            map["deviceType"] = tr("Saved");
            map["deviceList"] = tr("Devices");
            m_datamodel->insert(map);
        }
        bt_rdev_free_array(remote_device_array);
    }
    m_listview->setDataModel(m_datamodel);
}

void HOME::discover()
{
    bb::system::SystemDialog dialog;
    dialog.setTitle(tr("Searching..."));
    dialog.setBody(tr("Searching for Bluetooth devices..."));
    dialog.show();
    bt_disc_start_inquiry(BT_INQUIRY_GIAC);
    delay(10);
    bt_disc_cancel_inquiry();
    dialog.cancel();
    update_listview();
    bt_remote_device_t *next_remote_device = 0;
    bt_remote_device_t **remote_device_array = bt_disc_retrieve_devices(BT_DISCOVERY_CACHED, 0);
    if (remote_device_array) {
        for (int i = 0; (next_remote_device = remote_device_array[i]); ++i) {
            QVariantMap map;
            char buffer[128];
            const int bufferSize = sizeof(buffer);
            bt_rdev_get_friendly_name(next_remote_device, buffer, bufferSize);
            map["deviceName"] = QString::fromLatin1(buffer);
            bt_rdev_get_address(next_remote_device, buffer);
            map["deviceAddress"] = QString::fromLatin1(buffer);
            map["deviceClass"] = QString::number(bt_rdev_get_device_class(next_remote_device, BT_COD_DEVICECLASS));
            map["deviceType"] = tr("Unknown");
            map["deviceList"] = tr("Devices");
            m_datamodel->insert(map);
        }
        bt_rdev_free_array(remote_device_array);
    }
    m_listview->setDataModel(m_datamodel);
}

