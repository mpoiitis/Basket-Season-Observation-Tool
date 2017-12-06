#include "mediator.h"
#include "dbmanager.h"
#include <QString>
#include <iostream>

Mediator::Mediator(QObject *parent) : QObject(parent)
{

}

void Mediator::addTeam(QString name, QString image, QString url, int wins, int loses){
    DbManager::addTeam(name.toUtf8().constData(), image.toUtf8().constData(), url.toUtf8().constData(), wins, loses);
}

void Mediator::addPlayer(QString name, QString team, QString height, QString position){
    DbManager::addPlayer(name.toUtf8().constData(), team.toUtf8().constData(), height.toUtf8().constData(), position.toUtf8().constData());
}

void Mediator::deletePlayer(QString name){
    DbManager::deletePlayer(name.toUtf8().constData());
}

void Mediator::addResult(QString teamA, QString teamB, int pointsA, int pointsB, int match){
    DbManager::addResult(teamA.toUtf8().constData(), teamB.toUtf8().constData(), pointsA, pointsB, match);
}

void Mediator::rankings(MySqlModel *model){
    DbManager::rankings(model);
}

void Mediator::results(MySqlModel *model){
    DbManager::results(model);
}

void Mediator::teams(MySqlModel *model){
    DbManager::teams(model);
}

void Mediator::teamInfo(MySqlModel *model, QString name){
    DbManager::teamInfo(model, name.toUtf8().constData());
}

void Mediator::teamPlayers(MySqlModel *model, QString name){
    DbManager::teamPlayers(model, name.toUtf8().constData());
}
