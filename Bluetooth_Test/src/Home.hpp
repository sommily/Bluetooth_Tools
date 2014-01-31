/*
 * Home.hpp
 *
 *  Created on: 2014-1-26
 *      Author: user
 */

#ifndef HOME_HPP_
#define HOME_HPP_

#include <QObject>

#include <btapi/btdevice.h>
#include <btapi/btspp.h>
#include <bb/cascades/Label>
#include <bb/cascades/ListView>
#include <bb/cascades/ToggleButton>
#include <bb/cascades/GroupDataModel>

using namespace bb::cascades;

class HOME : public QObject
{
   Q_OBJECT
public:
	HOME();
	~HOME();
	void update();
	Q_INVOKABLE void init(QObject *name_label,QObject *mac_address_label,QObject *listview,QObject *bt_power_tb,QObject *bt_discoverable_tb);
	Q_INVOKABLE void change_bt_power(bool state);
	Q_INVOKABLE void change_bt_discoverable(bool state);
	Q_INVOKABLE void update_listview();
	Q_INVOKABLE void discover();

private:
	QString m_name;
	QString m_mac_address;
	bb::cascades::Label *m_name_label;
	bb::cascades::Label *m_mac_address_label;
	bb::cascades::ListView *m_listview;
	bb::cascades::ToggleButton *m_bt_power_togglebutton;
	bb::cascades::ToggleButton *m_bt_discoverable_togglebutton;
    bb::cascades::GroupDataModel* m_datamodel;
};


#endif /* HOME_HPP_ */
