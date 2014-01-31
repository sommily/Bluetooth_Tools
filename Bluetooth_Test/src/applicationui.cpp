/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "applicationui.hpp"
#include "Home.hpp"
#include "ChatManager.hpp"
#include "Setting.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <QFile>
#include <QIODevice>

using namespace bb::cascades;

ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
        QObject(app)
{
	void firstrun();
	firstrun();
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);
    bool res = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()));
    Q_ASSERT(res);
    Q_UNUSED(res);
    onSystemLanguageChanged();
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    QDeclarativeEngine * engine = qml->defaultDeclarativeEngine();
	QDeclarativeContext* rootContext = engine->rootContext();
    HOME *home = new HOME();
    rootContext->setContextProperty("_home",home);
    ChatManager *chatmanager = new ChatManager();
    rootContext->setContextProperty("_chatmanager",chatmanager);
    SETTING *setting = new SETTING();
    rootContext->setContextProperty("_setting",setting);
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    app->setScene(root);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    QString locale_string = QLocale().name();
    QString file_name = QString("Bluetooth_Test_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

void firstrun()
{
	QFile *file;
	if(!file->exists("data/setting.json"))
	{
		file = new QFile("data/setting.json");
		file->open(QIODevice::ReadWrite);
		file->write("{\n  \"time\" : \"5\"\n}\n");
		file->close();
		file = new QFile("data/switch_pane.json");
		file->open(QIODevice::ReadWrite);
		file->write("{\n  \"on\" : \"1\",\n  \"off\" : \"0\"\n}\n");
		file->close();
		file = new QFile("data/gamepad_pane.json");
		file->open(QIODevice::ReadWrite);
		file->write("{\n  \"up\" : \"0\",\n  \"down\" : \"0\",\n  \"left\" : \"0\",\n  \"right\" : \"0\",\n  \"stay\" : \"0\",\n  \"A\" : \"0\",\n  \"B\" : \"0\",\n  \"X\" : \"0\",\n  \"Y\" : \"0\"\n}\n");
		file->close();
	}
}
