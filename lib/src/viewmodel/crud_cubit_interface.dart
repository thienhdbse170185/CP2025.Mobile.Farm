abstract class ICrudCubit<T> {
  void fetchItems();
  void addItem(T item);
  void updateItem(T item);
  void deleteItem(String id);
}
