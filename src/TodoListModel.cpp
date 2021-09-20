#include "TodoListModel.h"

TodoListModel::TodoListModel(QObject *parent) : QAbstractListModel(parent)
{

}

QHash<int,QByteArray> TodoListModel::roleNames() const
{
    return {
      { DescriptionRole, "description" },
      { PriorityRole, "priority" },
      { FinishedRole, "finished" }
    };
}

int TodoListModel::rowCount(const QModelIndex & parent) const {
    if (parent.isValid())
        return 0;
    return mlist.size();
}

bool TodoListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!hasIndex(index.row(), index.column(), index.parent()) || !value.isValid())
        return false;

    TodoListItem &item = mlist[index.row()];
    if (role == DescriptionRole)
        item.description = value.toString();
    else if (role == PriorityRole)
        item.priority = value.toString();
    else if (role == FinishedRole)
        item.finished = value.toInt();
    else
        return false;

    emit dataChanged(index, index, { role } );

    return true;
}

QVariant TodoListModel::data(const QModelIndex & index, int role) const {
    if (!hasIndex(index.row(), index.column(), index.parent()))
        return {};

    const TodoListItem &item = mlist.at(index.row());
    if (role == DescriptionRole) return item.description;
    if (role == PriorityRole) return item.priority;
    if (role == FinishedRole) return item.finished;

    return {};
}
