//
//  SettingDetailViewController.swift
//  XGPSSample
//
//  Created by hjlee on 2017. 11. 2..
//  Copyright © 2017년 namsung. All rights reserved.
//

import UIKit

protocol SettingDetailDelegate: AnyObject {
    func didSelected(key: String, selected: Int)
}

class SettingDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var section: String = ""
    var items: [String] = []
    var selectedItem: String = "0"
    var delegate: SettingDetailDelegate?

    @IBOutlet var settingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_: Bool) {
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }

    func setData(section: String, items: [String], selected: String) {
        self.section = section
        self.items = items
        selectedItem = selected
    }

    // MARK: - tableview delegate

    func tableView(_: UITableView, titleForHeaderInSection _: Int) -> String? {
        section
    }

    func numberOfSections(in _: UITableView) -> Int {
        1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "settingDetailCell")
        // Configure the cell...
        let key = items[indexPath.row]
        if key == selectedItem {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        cell.textLabel?.text = key

        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelected(key: section, selected: indexPath.row)
        navigationController?.popViewController(animated: true)
    }
}
