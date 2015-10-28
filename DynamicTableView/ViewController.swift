//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Yuichi Fujiki on 8/28/15.
//  Copyright (c) 2015 responsivebytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!

    var data:[String] = ["Initial data1", "Initial data2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "identifier")

        tableView.reloadData()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        tableViewHeightConstraint.constant = tableView.contentSize.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(sender: AnyObject) {
        data.append("Additional data\(data.count + 1)")

        tableView.reloadData()

        tableViewHeightConstraint.constant = tableView.contentSize.height
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier")

        cell?.textLabel?.text = data[indexPath.row]

        return cell!
    }
}

