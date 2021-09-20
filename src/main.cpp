#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Qaterial/Qaterial.hpp>

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

    engine.load(url);

    return app.exec();
}
