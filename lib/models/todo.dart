class todo {
  String? id;
  String? todoText;
  bool isDone;

  todo({required this.id, required this.todoText, this.isDone = false});

  static List<todo> todolist() {
    return [
      todo(id: "01", todoText: "Morning exercises", isDone: true),
      todo(id: "02", todoText: "Buy Groceries", isDone: false),
      todo(id: "03", todoText: "Check emails"),
      todo(id: "04", todoText: "Team meeting"),
      todo(id: "05", todoText: "Work on mobile apps for 2 hour"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
      todo(id: "06", todoText: "Dinner with Jenny"),
    ];
  }
}
