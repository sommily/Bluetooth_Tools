#ifndef CHATMANAGER_HPP
#define CHATMANAGER_HPP

#include <bb/system/SystemDialog>
#include <QObject>
#include <QThread>

class SPPThread : public QThread
{
    Q_OBJECT
public:
    SPPThread(QObject *parent = 0);
    void init(int fd, bool isServer);
    int getFD() const;
    void resetFD();
    bool isServer() const;
    bool active() const;
    void run();
Q_SIGNALS:
    void incomingMessage(const QString&);
    void connectionClosed();
private:
    bool m_sppServer;
    int m_sppFD;
};
class ChatManager : public QObject
{
    Q_OBJECT
public:
    ChatManager(QObject *parent = 0);
    ~ChatManager();
    Q_INVOKABLE void setRemoteAddress(const QString &address);
    void setSPPServer(int fd);
    void setSPPClient(int fd);
public Q_SLOTS:
	Q_INVOKABLE bool connectToSPPService();
    void startSPPServer();
    Q_INVOKABLE void sendSPPMessage(const QString &msg);
    Q_INVOKABLE void closeSPPConnection();
Q_SIGNALS:
    void chatEnded();
    void chatHistoryChanged();
private:
    void showDialog(const QString &title, const QString &message);
    SPPThread m_sppDataThread;
    QString m_remoteAddress;
    bb::system::SystemDialog m_waitDialog;
};

#endif
