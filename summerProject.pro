TEMPLATE = app

QT += sql
QT += qml quick
QT += widgets
CONFIG += c++11

SOURCES += main.cpp \
    dbmanager.cpp \
    mediator.cpp \
    mysqlmodel.cpp

RESOURCES += qml.qrc
RESOURCES += images\

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    dbmanager.h \
    mediator.h \
    mysqlmodel.h
