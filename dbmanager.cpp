#include "dbmanager.h"
#include "mysqlmodel.h"
#include <QSqlQuery>
#include <QDebug>
#include <QString>
#include <string>
#include <QSqlError>
#include <QSqlRecord>

void DbManager::createDatabase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("MyHost");
    db.setDatabaseName("MyDatabase");
    db.setUserName("MyUser");
    db.setPassword("MyPassword");

    if (!db.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database: connection ok";
    }

    if ( !(db.tables().contains(QLatin1String("Players")) ||
         db.tables().contains(QLatin1String("Teams")) ||
         db.tables().contains(QLatin1String("Results")))) {


        // Create the tables if they don't already exist
        QSqlQuery query;
        query.exec("CREATE TABLE IF NOT EXISTS Teams "
                   "(name TEXT PRIMARY KEY, "
                   "image VARCHAR(50), "
                   "url TEXT, "
                   "wins INTEGER, "
                   "loses INTEGER) ");

        query.exec("CREATE TABLE IF NOT EXISTS Players "
                   "(name TEXT PRIMARY KEY, "
                   "team TEXT, "
                   "ftHeight TEXT, "
                   "position TEXT)");

        query.exec("CREATE TABLE IF NOT EXISTS Results "
                   "(teamA TEXT, "
                   "teamB TEXT, "
                   "pointsA INTEGER, "
                   "pointsB INTEGER, "
                   "match INTEGER, "
                   "PRIMARY KEY(teamA, teamB, match))");

        //1st record
        DbManager::addTeam("Warriors","qrc:/images/warriors.png","http://www.nba.com/warriors/",0,0);

        //2nd record
        DbManager::addTeam("Thunder","qrc:/images/thunder.png","http://www.nba.com/thunder/",0,0);

        //3rd record
        DbManager::addTeam("Raptors","qrc:/images/raptors.png","http://www.nba.com/raptors/",0,0);

        //4th record
        DbManager::addTeam("Cavaliers","qrc:/images/cavaliers.png","http://www.nba.com/cavaliers/",0,0);

        DbManager::addResult("Thunder","Cavaliers",105,109,16);
        DbManager::addResult("Warriors","Raptors",98,85,18);
        DbManager::addResult("Thunder","Warriors",102,109,17);
        DbManager::addResult("Thunder","Warriors",98,90,13);
        DbManager::addResult("Raptors","Warriors",89,82,15);
        DbManager::addResult("Cavaliers","Raptors",84,89,18);

        DbManager::addPlayer("Kyrie Irving","Cavaliers","6'3","PG");
        DbManager::addPlayer("J.R. Smith","Cavaliers","6'6","SG");
        DbManager::addPlayer("LeBron James","Cavaliers","6'8","SF");
        DbManager::addPlayer("Kevin Love","Cavaliers","6'10","PF");
        DbManager::addPlayer("Tristan Thompson","Cavaliers","6'9","C");

        DbManager::addPlayer("Stephen Curry","Warriors","6'3","PG");
        DbManager::addPlayer("Klay Thompson","Warriors","6'7","SG");
        DbManager::addPlayer("Harrison Barnes","Warriors","6'8","SF");
        DbManager::addPlayer("Draymond Green","Warriors","6'7","PF");
        DbManager::addPlayer("Andrew Bogut","Warriors","7'0","C");

        DbManager::addPlayer("Kyle Lowry","Raptors","6'0","PG");
        DbManager::addPlayer("DeMar DeRozan","Raptors","6'7","SG");
        DbManager::addPlayer("DeMarre Carroll","Raptors","6'8","SF");
        DbManager::addPlayer("Patrick Patterson","Raptors","6'9","PF");
        DbManager::addPlayer("Jonas Valanciunas","Raptors","7'0","C");

        DbManager::addPlayer("Russell Westbrook","Thunder","6'3","PG");
        DbManager::addPlayer("Dion Waiters","Thunder","6'4","SG");
        DbManager::addPlayer("Kevin Durant","Thunder","6'9","SF");
        DbManager::addPlayer("Serge Ibaka","Thunder","6'10","PF");
        DbManager::addPlayer("Steven Adams","Thunder","7'0","C");

    }
}

bool DbManager::addTeam(const string &name, const string &image, const string &url, int wins, int loses)
{
    bool success = false;
    if(name.empty())
        return success;

    if(!DbManager::teamExists(name))
    {

        QSqlQuery query;
        query.prepare("INSERT INTO Teams (name,image,url,wins,loses) "
                      "VALUES (:name,:image,:url,:wins,:loses)" );
        query.bindValue(":name",QString::fromStdString(name));
        query.bindValue(":image",QString::fromStdString(image));
        query.bindValue(":url",QString::fromStdString(url));
        query.bindValue(":wins",wins);
        query.bindValue(":loses",loses);

        if(query.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "addTeam error:  "
                     << query.lastError();
        }
    }

    return success;
}

bool DbManager::teamExists(const string &name)
{
    bool success = false;
    QSqlQuery query;
    query.prepare("SELECT name FROM Teams WHERE name = (:name)");
    query.bindValue(":name", QString::fromStdString(name));

    if (query.exec())
    {
        if (query.next())
        {
            success = true;
        }
    }

    return success;
}

bool DbManager::addPlayer(const string &name, const string &team, const string &height, const string &position)
{
    bool success = false;

    if (!playerExists(name))
    {
        QSqlQuery query;
        query.prepare("INSERT INTO Players (name,team,ftHeight,position) VALUES (:name, :team, :height, :position)");
        query.bindValue(":name",QString::fromStdString(name));
        query.bindValue(":team",QString::fromStdString(team));
        query.bindValue(":height",QString::fromStdString(height));
        query.bindValue(":position",QString::fromStdString(position));
        if(query.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "addPlayer error:  "
                     << query.lastError();
        }
    }

    return success;
}

bool DbManager::deletePlayer(const string &name)
{
    bool success = false;
    if (playerExists(name))
    {
        QSqlQuery query;
        query.prepare("DELETE FROM Players WHERE name = (:name)");
        query.bindValue(":name", QString::fromStdString(name));
        success = query.exec();

        if(!success)
        {
            qDebug() << "deletePlayer error: "
                     << query.lastError();
        }
    }

    return success;
}

bool DbManager::playerExists(const string &name)
{
    bool success = false;
    QSqlQuery query;
    query.prepare("SELECT name FROM Players WHERE name = (:name)");
    query.bindValue(":name", QString::fromStdString(name));

    if (query.exec())
    {
        if (query.next())
        {
            success = true;
        }
    }

    return success;
}

bool DbManager::addResult(const string &teamA, const string &teamB, int pointsA, int pointsB, int match)
{
    bool success = false;

    if(! (teamExists(teamA) && teamExists(teamB)))
        return success;

    if (!resultExists(teamA,teamB,match))
    {
        QSqlQuery query;
        query.prepare("INSERT INTO Results (teamA,teamB,pointsA,pointsB,match) "
                      "VALUES (:teamA, :teamB, :pointsA, :pointsB, :match)");
        query.bindValue(":teamA",QString::fromStdString(teamA));
        query.bindValue(":teamB",QString::fromStdString(teamB));
        query.bindValue(":pointsA",pointsA);
        query.bindValue(":pointsB",pointsB);
        query.bindValue(":match",match);
        if(query.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "addResult error:  "
                     << query.lastError();
        }
        updateTeamStats(teamA, pointsA>pointsB);
        updateTeamStats(teamB, pointsB>pointsA);
    }

    return success;
}

bool DbManager::resultExists(const string &teamA, const string &teamB, int match)
{
    bool success = false;
    QSqlQuery query;
    query.prepare("SELECT * FROM Results WHERE teamA = (:teamA) AND teamB = (:teamB) AND match = (:match)");
    query.bindValue(":teamA", QString::fromStdString(teamA));
    query.bindValue(":teamB", QString::fromStdString(teamB));
    query.bindValue(":match", match);

    if (query.exec())
    {
        if (query.next())
        {
            success = true;
        }
    }

    return success;
}

bool DbManager::updateTeamStats(const string &name, bool status)
{
    bool success = false;
    QSqlQuery query;
    QSqlQuery q1;
    //status contains whether that team has won or not
    if (status){
        //get wins of team
        query.prepare("SELECT wins FROM Teams WHERE name = (:name)");
        query.bindValue(":name",QString::fromStdString(name));
        query.exec();

        query.first();
        int wins = query.value(0).toInt();
        int newwins = wins + 1;
        q1.prepare("UPDATE Teams SET wins = (:result) WHERE name = (:name)");
        q1.bindValue(":name", QString::fromStdString(name));
        q1.bindValue(":result", newwins);
        success = q1.exec();
        if(!success)
        {
            qDebug() << "updateTeamStats error: "
                     << q1.lastError();
        }
    }
    else{
        //get loses of team
        query.prepare("SELECT loses FROM Teams WHERE name = (:name)");
        query.bindValue(":name", QString::fromStdString(name));
        query.exec();

        query.first();
        int loses = query.value(0).toInt();
        int newloses = loses + 1;
        q1.prepare("UPDATE Teams SET loses = (:result) WHERE name = (:name)");
        q1.bindValue(":name", QString::fromStdString(name));
        q1.bindValue(":result", newloses);
        success = q1.exec();
        if(!success)
        {
            qDebug() << "updateTeamStats error: "
                     << q1.lastError();
        }
    }

    return success;
}

void DbManager::rankings(MySqlModel *model)
{
    model->setQuery("SELECT name,image,wins,loses FROM Teams ORDER BY wins-loses DESC, name ASC");
}

void DbManager::results(MySqlModel *model)
{
    model->setQuery("SELECT * FROM Results ORDER BY match DESC, teamA ASC");
}

void DbManager::teams(MySqlModel *model)
{
    model->setQuery("SELECT * FROM Teams");
}

void DbManager::teamInfo(MySqlModel *model, const string &name)
{
    model->setQuery("SELECT * FROM Results WHERE teamA = '" +
                    QString::fromStdString(name) +
                    "' OR teamB = '" +
                    QString::fromStdString(name) +
                    "' ORDER BY match DESC, teamA ASC");
}

void DbManager::teamPlayers(MySqlModel *model, const string &name)
{
    model->setQuery("SELECT * FROM Players WHERE team = '" +
                    QString::fromStdString(name) +
                    "' ORDER BY position ASC, name ASC");
}
