#ifndef MEDIATOR_H
#define MEDIATOR_H

using namespace std;
#include <QObject>
#include <String>
#include <QtQml>
#include <QString>
#include "mysqlmodel.h"

class Mediator : public QObject
{
    Q_OBJECT
    #define QML_REGISTER(a) static int unused_val = qmlRegisterType<a>("Mediators", 1, 0, "Mediator")
//methods used by javascript
public:
    explicit Mediator(QObject *parent = 0);

    Q_INVOKABLE void addTeam(QString name, QString image, QString url, int wins, int loses);

    Q_INVOKABLE void addPlayer(QString name, QString team, QString height, QString position);
    Q_INVOKABLE void deletePlayer(QString name);

    Q_INVOKABLE void addResult(QString teamA, QString teamB, int pointsA, int pointsB, int match);

    Q_INVOKABLE void rankings(MySqlModel *model);
    Q_INVOKABLE void results(MySqlModel *model);
    Q_INVOKABLE void teams(MySqlModel *model);
    Q_INVOKABLE void teamInfo(MySqlModel *model, QString name);
    Q_INVOKABLE void teamPlayers(MySqlModel *model, QString name);

};
#endif // MEDIATOR_H
