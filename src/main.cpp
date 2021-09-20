#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Qaterial/Qaterial.hpp>
#include <QQmlContext>

#include "TodoListModel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    app.setOrganizationName("NothingElseLab");
    app.setApplicationName("trackball");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath("qrc:///");

    qaterial::loadQmlResources();
    qaterial::registerQmlTypes();

    // TODO: ModelManager
    //       https://www.jianshu.com/p/65d4d0b4b22a
    TodoListModel todoListModel;
    engine.rootContext()->setContextProperty("todoListModel", &todoListModel);

    engine.load(url);

    return app.exec();
}
