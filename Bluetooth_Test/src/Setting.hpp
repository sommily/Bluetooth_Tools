/*
 * Setting.hpp
 *
 *  Created on: 2014-1-29
 *      Author: user
 */

#ifndef SETTING_HPP_
#define SETTING_HPP_

#include <QObject>
#include <bb/cascades/Label>

using namespace bb::cascades;

class SETTING : public QObject
{
   Q_OBJECT
public:
    SETTING();
	~SETTING();
	Q_INVOKABLE QString get_value(QString pane,QString key);
	Q_INVOKABLE void save_value(QString pane,QString key,QString value);
private:

};


#endif /* SETTING_HPP_ */
