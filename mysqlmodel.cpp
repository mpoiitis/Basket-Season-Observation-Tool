#include "mysqlmodel.h"
#include <QSqlRecord>
#include <QSqlField>


MySqlModel::MySqlModel(QObject *parent)
    : QSqlQueryModel(parent)
{
}

void MySqlModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query, db);
    generateRoleNames();
}

void MySqlModel::setQuery(const QSqlQuery &query)
{
    QSqlQueryModel::setQuery(query);
    generateRoleNames();
}

void MySqlModel::generateRoleNames()
{
    privateRoleNames.clear();
    for( int i = 0; i < record().count(); i ++) {
        privateRoleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
}

QVariant MySqlModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }

    return value;
}
