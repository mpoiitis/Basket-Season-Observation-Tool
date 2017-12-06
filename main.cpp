#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlRecord>
#include <QQmlContext>
#include "dbmanager.h"
#include "mediator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    //make class qml-usable by importing SqlQmlModels 1.0 in main.qml
    QML_REGISTER(Mediator);//macro defined in sqlqmlmodel.h

    DbManager *a = new DbManager();
    a->createDatabase();

    MySqlModel *model = new MySqlModel(0);
    MySqlModel *model2 = new MySqlModel(0);
    MySqlModel *model3 = new MySqlModel(0);

    engine.rootContext()->setContextProperty("myModel", model);
    engine.rootContext()->setContextProperty("myModel2", model2);
    engine.rootContext()->setContextProperty("myModel3", model3);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
