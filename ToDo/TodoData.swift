//
//  TodoData.swift
//  ToDo
//
//  Created by 木村美希 on 2023/02/26.
//

import UIKit
import RealmSwift

class TodoDataViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var dateDatePicker: UIDatePicker!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(){
        let item = TodoList()
        item.title = titleTextField.text ?? ""
        item.content = contentTextField.text ?? ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'年'M'月'd'日('EEEEE') '"
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let date = dateFormatter.string(from: dateDatePicker.date)

        item.date = date
        
        createItem(item: item)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func createItem(item: TodoList){
        try! realm.write {
            realm.add(item)
        }
    }
    


}

