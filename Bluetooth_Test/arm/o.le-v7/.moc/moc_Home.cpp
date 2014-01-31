/****************************************************************************
** Meta object code from reading C++ file 'Home.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/Home.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Home.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_HOME[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      75,    6,    5,    5, 0x02,
     132,  126,    5,    5, 0x02,
     154,  126,    5,    5, 0x02,
     183,    5,    5,    5, 0x02,
     201,    5,    5,    5, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_HOME[] = {
    "HOME\0\0"
    "name_label,mac_address_label,listview,bt_power_tb,bt_discoverable_tb\0"
    "init(QObject*,QObject*,QObject*,QObject*,QObject*)\0"
    "state\0change_bt_power(bool)\0"
    "change_bt_discoverable(bool)\0"
    "update_listview()\0discover()\0"
};

void HOME::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        HOME *_t = static_cast<HOME *>(_o);
        switch (_id) {
        case 0: _t->init((*reinterpret_cast< QObject*(*)>(_a[1])),(*reinterpret_cast< QObject*(*)>(_a[2])),(*reinterpret_cast< QObject*(*)>(_a[3])),(*reinterpret_cast< QObject*(*)>(_a[4])),(*reinterpret_cast< QObject*(*)>(_a[5]))); break;
        case 1: _t->change_bt_power((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->change_bt_discoverable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->update_listview(); break;
        case 4: _t->discover(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData HOME::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject HOME::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_HOME,
      qt_meta_data_HOME, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &HOME::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *HOME::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *HOME::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_HOME))
        return static_cast<void*>(const_cast< HOME*>(this));
    return QObject::qt_metacast(_clname);
}

int HOME::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
