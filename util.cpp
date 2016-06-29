#include "util.h"
#include <QDesktopServices>
#include <QUrl>

void Util::run(QString fileName) {
// Для полного соответствия лучше вызывать из того же каталога, где находится файл.
// Алгоритма на примере python:
//
//    import os
//    old_cwd = os.getcwd()
//    os.chdir(os.path.dirname(file_name))
//    QDesktopServices.openUrl(QUrl.fromLocalFile(file_name))
//    os.chdir(old_cwd)

    QDesktopServices::openUrl(QUrl::fromLocalFile(fileName));
}
