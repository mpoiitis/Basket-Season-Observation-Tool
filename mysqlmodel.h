#ifndef MYSQLMODEL_H
#define MYSQLMODEL_H

#pragma once
#include <QSqlQueryModel>

class MySqlModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit MySqlModel(QObject *parent);
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return privateRoleNames;	}

private:
    void generateRoleNames();
    QHash<int, QByteArray> privateRoleNames;
};

#endif // MYSQLMODEL_H
