#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include "util.h"

int main(int argc, char* argv[])
{
    QApplication app(argc,argv);   

    QQmlApplicationEngine engine;
    QQmlContext* rootContext = engine.rootContext();
    rootContext->setContextProperty("Util", new Util());

    engine.load(QUrl("qrc:/main"));

    return app.exec();
}
