/*
 * Setting.cpp
 *
 *  Created on: 2014-1-29
 *      Author: user
 */

#include "Setting.hpp"

#include <QDir>
#include <QFile>
#include <QIODevice>
#include <bb/data/JsonDataAccess>

using namespace bb::data;

SETTING::SETTING()
{
}

SETTING::~SETTING()
{
}

QString SETTING::get_value(QString pane,QString key)
{
	JsonDataAccess jda;
	QVariant temp = jda.load("data/" + pane + "_pane.json");
	QVariantMap map = temp.toMap();
	return map[key].toString();
}

void SETTING::save_value(QString pane,QString key,QString value)
{
	JsonDataAccess jda;
	QVariant temp = jda.load("data/" + pane + "_pane.json");
	QVariantMap map = temp.toMap();
	map[key] = value;
	temp = map;
	jda.save(temp,"data/" + pane + "_pane.json");
}
