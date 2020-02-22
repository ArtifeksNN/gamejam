#include <QApplication>
#include <FelgoApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{

    QApplication app(argc, argv);
    FelgoApplication felgo;
    QQmlApplicationEngine engine;

    int _health = 5;

    QQmlContext *context = new QQmlContext(engine.rootContext());
    context->setContextProperty("health", _health);

    felgo.initialize(&engine);
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
