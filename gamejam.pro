# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.artifeks.wizardEVP.Gamejam
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "AEC67375EF38C6368617AE18D43CEB99D4944537F4476829A30CBD3DB4C57739BDB9E1173B96C02FFBA0E7C6CCF7677EC1DDECBDB8EECA9BFA1219B44D2BE2C726EE38110AD5335B58AF505B6FC7491B935988659FC447D0B393728E6D0C802854FE87DB78029584FAA63289B4D107A70102D49870D2E9DC07BFA873E2327DBF3813BD2E2C5460F0277190D87D1157681080153FD1006044F12FCADAC8209C88177288635FCAE514CA5A24DEFAA68A26E15AB66A548EDE1438EFD30BB4C530B9F03B303E73E52B0FFF19A17F182129D0479D73809ED17F60AA055A47B87AFB053295DB71A4B3CCBC36FEC947B8AE7D7BB4C8C07A94375B4927A746951808800B37E293EBA68B2B7B0E02735008269B062D792BA77266E22A950D215E4AA8C47C068C9339645EFFD1B591C723E78B3B89"

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
