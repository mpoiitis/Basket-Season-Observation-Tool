#ifndef DBMANAGER_H
#define DBMANAGER_H

using namespace std;
#include <QSqlDatabase>
#include <String>
#include "mysqlmodel.h"


class DbManager
{
public:
    void createDatabase();
    static bool addTeam(const string &name, const string &image, const string &url, int wins, int loses);
    static bool teamExists(const string &name);
    static bool addPlayer(const string &name, const string &team, const string &height, const string &position);
    static bool deletePlayer(const string &name);
    static bool playerExists(const string &name);
    static bool addResult(const string &teamA, const string &teamB, int pointsA, int pointsB, int match);
    static bool resultExists(const string &teamA, const string &teamB, int match);
    static bool updateTeamStats(const string &name, bool status);

    static void rankings(MySqlModel *model);
    static void results(MySqlModel *model);
    static void teams(MySqlModel *model);
    static void teamInfo(MySqlModel *model, const string &name);
    static void teamPlayers(MySqlModel *model, const string &name);
private:
    QSqlDatabase db;
};

#endif // DBMANAGER_H
