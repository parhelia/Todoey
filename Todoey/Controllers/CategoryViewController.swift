//
//  CategoryViewController.swift
//  Todoey
//
//  Created by ET on 2018-03-12.
//  Copyright © 2018 ET. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let cellIdentifier : String = "CategoryCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()

    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let category = categoryArray[indexPath.row]

        cell.textLabel?.text = category.name

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }

    //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }



    //MARK: - Data Manipulation Methods
    func saveCategories() {

        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }

        tableView.reloadData()

    }

    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {

        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }

        tableView.reloadData()
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            //what will happen once the user clicks the add item button on our UIAlert

            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categoryArray.append(newCategory)

            self.saveCategories()

        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
}