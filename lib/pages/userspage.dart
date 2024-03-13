import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/helpers/user_sql_helper.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await UserSQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _businessLineController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _firstNameController.text = existingJournal['firstName'];
      _lastNameController.text = existingJournal['lastName'];
      _imageController.text = existingJournal['image'];
      _businessLineController.text = existingJournal['businessLine'];
      _departmentController.text = existingJournal['department'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _businessLineController,
                decoration: const InputDecoration(hintText: 'Business Line'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _departmentController,
                decoration: const InputDecoration(hintText: 'Department'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _imageController,
                decoration: const InputDecoration(hintText: 'Image'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new journal
                  if (id == null) {
                    await _addItem();
                  }

                  if (id != null) {
                    await _updateItem(id);
                  }

                  // Clear the text fields
                  _firstNameController.text = '';
                  _lastNameController.text = '';
                  _imageController.text = '';
                  _businessLineController.text = '';
                  _departmentController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ));
  }

  
// Insert a new journal to the database
  Future<void> _addItem() async {
    await UserSQLHelper.createItem(
        _firstNameController.text, _lastNameController.text, _imageController.text, _businessLineController.text, _departmentController.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await UserSQLHelper.updateItem(
        id, _firstNameController.text, _lastNameController.text, _imageController.text, _businessLineController.text, _departmentController.text);
    _refreshJournals();
  }

    // Delete an item
  void _deleteItem(int id) async {
    await UserSQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  String receiveImage(String img) {
    if (img.startsWith("http")) {
      return img;
    }
    return "https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          color: Colors.green[200],
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text('created at :'),
              Text(_journals[index]['createdAt']),
              ListTile(
                  title: Text(_journals[index]['firstName'] as String),
                  subtitle: Text(_journals[index]['lastName'] as String),
                  leading: 
                  CircleAvatar(
                            child: ClipOval(
                            child: Image.network(
                              receiveImage(_journals[index]['image']as String),
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        )),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(_journals[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              _deleteItem(_journals[index]['id']),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}