#ifndef TODOLISTMODEL_H
#define TODOLISTMODEL_H

#include <QAbstractListModel>
#include <QObject>

#include "TodoListItem.h"

class TodoListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_ENUMS(TodoItemRoles)
public:
    enum TodoItemRoles {
        DescriptionRole = Qt::UserRole + 1,
        PriorityRole,
        FinishedRole
    };

    explicit TodoListModel(QObject *parent = nullptr);
    QHash<int,QByteArray> roleNames() const override;
    int rowCount(const QModelIndex & parent = QModelIndex()) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;

private:
    QVector<TodoListItem> mlist
    {
        {"desc", "A", true}
    };
};

#endif // TODOLISTMODEL_H
