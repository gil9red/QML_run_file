#ifndef UTIL_H
#define UTIL_H

#include <QObject>

class Util: public QObject {
    Q_OBJECT

    public slots:
        void run(QString fileName);
};


#endif // UTIL_H
